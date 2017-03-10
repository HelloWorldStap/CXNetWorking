//
//  CXCacheStrate.h
//  CXNetWorking
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CXCacheStrate : NSObject
/**
 网络是否可用yes是可用no是不可用
 */
+(BOOL)NetWorkingEnable;
/**
 时间是不是超过预定的时间yes是超过no是没超过
 */
+(BOOL)TimeOut:(NSInteger)time withTimeKey:(NSString *)key;
/**
 版本是不是改变了yes是改变了(版本是不一样的)no是没有改变（版本还是一样）
 */
+(BOOL)VisionChnage;
@end
