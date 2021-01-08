//
//  ZLTimerTarget.h
//  TZLDemo
//
//  Created by TZL on 2021/1/8.
//  Copyright © 2021 Tzl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTimerTarget : NSObject
/**  弱引用  **/
@property (nonatomic , assign)id  target;

/// 创建对象
/// @param traget 传入的target
+ (instancetype)initWihtTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
