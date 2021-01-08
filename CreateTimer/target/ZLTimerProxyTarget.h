//
//  ZLTimerProxyTarget.h
//  TZLDemo
//
//  Created by TZL on 2021/1/8.
//  Copyright © 2021 Tzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTimerProxyTarget : NSProxy

+ (instancetype)initWithTarget:(id)target;
/**  target  **/
@property (nonatomic , assign)id  target;

@end

NS_ASSUME_NONNULL_END
