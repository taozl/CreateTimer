//
//  ZLTimerProxyTarget.m
//  TZLDemo
//
//  Created by TZL on 2021/1/8.
//  Copyright © 2021 Tzl. All rights reserved.
//

#import "ZLTimerProxyTarget.h"

@implementation ZLTimerProxyTarget
+ (instancetype)initWithTarget:(id)target{
    ///NSProxy 这个就是父类，不需要init，初始化
    ZLTimerProxyTarget *zlTimer = [ZLTimerProxyTarget alloc];
    zlTimer.target = target;
    return zlTimer;
}



///直接消息转发
///消息签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}
///最后的消息转发
- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation  invokeWithTarget:self.target];
}
@end
