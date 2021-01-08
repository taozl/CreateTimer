//
//  ZLTimerTarget.m
//  TZLDemo
//
//  Created by TZL on 2021/1/8.
//  Copyright © 2021 Tzl. All rights reserved.
//

#import "ZLTimerTarget.h"

@implementation ZLTimerTarget
- (void)dealloc{
    NSLog(@"%s",__func__);
}


+ (instancetype)initWihtTarget:(id)target{
    ZLTimerTarget *zlTimer = [[ZLTimerTarget alloc]init];
    zlTimer.target = target;
    return zlTimer;
}

///消息转发，转发给谁来做这个事儿，就是转发给传进来的target来做
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}
@end
