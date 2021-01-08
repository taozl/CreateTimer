//
//  main.m
//  CreateTimer
//
//  Created by TZL on 2021/1/8.
//

#import <UIKit/UIKit.h>
#import "ZLAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([ZLAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
