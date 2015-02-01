//
//  Runloop
//
//  Created by Prokofev Ruslan on 01.02.15.
//  Copyright (c) 2015 Prokofev Ruslan. All rights reserved.
//

//  Application.m
#import "Application.h"
#define GET_THREAD_NAME NSLog(@"thread %@",[NSThread currentThread].name);
#define GET_CallStackSymbols  NSLog(@"%@",[NSThread callStackSymbols]);

@interface Application ()
{
    NSTimer *_timer;
    BOOL isStop;
}
@end
@implementation Application

- (id) init
{
    if (self = [super init]) {
        [self run];
    }
    return self;
}


- (void) run
{
    NSLog(@"Run main");
    [self performSelector:@selector(mainTest) withObject:nil afterDelay:1];
    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(timerMain) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSDefaultRunLoopMode];
    BOOL shouldKeepRunning = YES;        // global
    NSRunLoop *theRL = [NSRunLoop currentRunLoop];
    while (shouldKeepRunning && [theRL runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
    
    
}

- (void) timerMain
{
    NSLog(@"Timer main");
    if (isStop) {
        NSLog(@"stop runloop");
        isStop = false;
        CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
        CFRunLoopStop(runLoop);
        NSLog(@"%p",runLoop);

    }
}

- (void) mainTest
{
    NSLog(@"main perfom");
    [self performSelector:@selector(mainTest1) withObject:nil afterDelay:1];
    CFRunLoopRunInMode((CFStringRef)NSDefaultRunLoopMode, MAXFLOAT, NO);
    CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
    NSLog(@"%p",runLoop);

}
- (void) mainTest1
{
//
    CFRunLoopRef runLoop = [[NSRunLoop currentRunLoop] getCFRunLoop];
    NSLog(@"%p",runLoop);

    isStop = true;
}
@end
