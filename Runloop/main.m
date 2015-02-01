//
//  main.m
//  Runloop
//
//  Created by Prokofev Ruslan on 01.02.15.
//  Copyright (c) 2015 Prokofev Ruslan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Application.h"

int main(int argc, const char * argv[]) {
    
//    NSLog(@"main 1");
    [[NSThread mainThread]setName:@"MAIN"];
//    GET_THREAD_NAME
//        [[NSThread currentThread]setName:@"GLOBAL"];
    //    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        GET_THREAD_NAME
//        NSLog(@"main 3");
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        GET_THREAD_NAME
//        NSLog(@"main 4");
//    });
//
//    GET_THREAD_NAME
//    NSLog(@"main 2");
//    
//    while (1) {
//        
//    }
    [Application new];
    return 0;
    
}
