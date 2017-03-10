//
//  CXCacheStrate.m
//  CXNetWorking
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXCacheStrate.h"
#import <UIKit/UIKit.h>
//#import "AFNetworking.h"
#import "YYCache.h"
#define TimeKey @"timeKey"
#define Version @"version"
@implementation CXCacheStrate
+(BOOL)NetWorkingEnable
{
    NSInteger net = [self getNetWorkStates];
    if (net>2) {
        return YES;
    }
    return NO;

}
//0是无网络,1是2g，2是3g，3是4g，4是wiffe
+ (NSInteger )getNetWorkStates{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSInteger netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
        }
    }
    return netType;
}


/**
 时间是不是超过预定的时间  yes是mei超过no是超过
 */
+(BOOL)TimeOut:(NSInteger)time withTimeKey:(NSString *)key;
{
    NSDate *date = [[NSUserDefaults standardUserDefaults]objectForKey:key];
    NSDate *newdate = [NSDate date];
    NSTimeInterval newTime =[newdate timeIntervalSince1970]*1;

    if (!date) {
    [[NSUserDefaults standardUserDefaults]setObject:newdate forKey:key];
        return NO;
    }
        NSTimeInterval oldTime = [date timeIntervalSince1970]*1;
        
        if (newTime-oldTime<time) {
            return YES;
        }
        [[NSUserDefaults standardUserDefaults]setObject:newdate forKey:key];
        return NO;
    
    
//        if (newTime-oldTime>time||!date) {
//
//        return YES;
//    }
//    return NO;

}
/**
 版本是不是改变了yes是改变了(版本是不一样的)no是没有改变（版本还是一样）
 */
+(BOOL)VisionChnage
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
  NSString *version =[[NSUserDefaults standardUserDefaults]objectForKey:Version];
    
    if (!version||![version isEqualToString:appCurVersion]) {
    [[NSUserDefaults standardUserDefaults]setValue:appCurVersion forKey:Version];
        return YES;
    }
    
    return NO;
    
}
@end
