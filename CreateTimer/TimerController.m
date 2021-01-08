//
//  TimerController.m
//  TZLDemo
//
//  Created by TZL on 2021/1/8.
//  Copyright © 2021 Tzl. All rights reserved.
//

#import "TimerController.h"
#import "ZLTimerTarget.h"
#import "ZLTimerProxyTarget.h"///NSProxy转发
@interface TimerController ()
/**  定时器  **/
@property (nonatomic , strong)NSTimer  *timer;
/**  定时器2  **/
@property (nonatomic , strong)CADisplayLink  *caDis;
/**  定时器3  **/
@property (nonatomic , strong)dispatch_source_t gcdTimer;


@end

@implementation TimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    ///创建定时器
//    [self createNSTimer];
    [self createCAD];
//    [self createGCDTimer];
}
#pragma mark - --------- NSTimer 创建 ---------
- (void)createNSTimer{
    ///这里相当于走了msg_send消息发送机制，会走三大步
//    self.timer = [NSTimer timerWithTimeInterval:1 target:[ZLTimerTarget initWihtTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    
    ///这里就直接走最后一步的消息转发，通过消息签名去执行方法 ！！！！会走消息转发！！！！！
    self.timer = [NSTimer timerWithTimeInterval:1 target:[ZLTimerProxyTarget initWithTarget:self] selector:@selector(test) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - --------- CAD创建定时器  ---------
///一秒60帧左右
- (void)createCAD{
    //    self.caDis = [CADisplayLink displayLinkWithTarget:[ZLTimerTarget initWithTarget:self] selector:@selector(test)];;
        ///这里就直接走最后一步的消息转发，通过消息签名去执行方法 ！！！！会走消息转发！！！！！
    self.caDis = [CADisplayLink displayLinkWithTarget:[ZLTimerProxyTarget initWithTarget:self] selector:@selector(test)];
    [self.caDis addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}


#pragma mark - --------- GCD创建定时器  ---------
- (void)createGCDTimer{

    NSLog(@"开始");
    dispatch_queue_t queue = dispatch_queue_create("当前队列", DISPATCH_QUEUE_CONCURRENT);
//    ///创建一个定时器
    self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);///queue是指的在哪个队列中做事情
    /**
     DISPATCH_TIME_NOW :立马执行  dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC) (这个是延迟两秒后执行)
     
     intervalInSeconds：间隔多少秒做事情
     
     leewayInSeconds :传0即可 回旋参数
     **/
    dispatch_source_set_timer(self.gcdTimer,
                              dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC) ,
                              1 * NSEC_PER_SEC,
                              0);

    /** 执行的任务   **/
    dispatch_source_set_event_handler(self.gcdTimer, ^{
        NSLog(@"sss");
    });
    
//    /**
//     执行任务
//     dispatch_function_t  _Nullable handler:这里要传一个C语言的函数：  void (*dispatch_function_t)(void *_Nullable)
//     **/
//    dispatch_source_set_event_handler_f(self.gcdTimer, xxx);
    ///开启定时器
    dispatch_resume(self.gcdTimer);
}
/////C语言的执行方法
//void xxx(void *param){
//    NSLog(@"sss");
//};



#pragma mark - --------- 私有方法  ---------
///定时任务
- (void)test{
    NSLog(@"输出了");
}

-(void)dealloc{
    NSLog(@"%s",__func__);
    ///定时器要销毁
    [self.timer invalidate];
    [self.caDis invalidate];
}



@end
