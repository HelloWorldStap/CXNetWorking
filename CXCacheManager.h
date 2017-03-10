//
//  CXCacheManager.h
//  CXNetWorking
//
//  Created by mac on 2017/3/9.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXCacheManager : NSObject
/**
 清除缓存传入的是你要清除的那个请求的url和传入的参数的字典
 */
+(void)removeCacheforAppendurl:(NSString *)appaendUrl Withparam:(NSDictionary *)param;
/**
 清除缓存之后的操作 传入的是你要清除的那个请求的url和传入的参数的字典
 */
+(void)removeCacheforAppendurl:(NSString *)appaendUrl Withparam:(NSDictionary *)param finsh:(void(^)(NSString *key))block;

/**
 清除全部的缓存
 */
+(void)removeAllCache;
/**
 移除所有的缓存之后的操作
 */
+(void)removeAllCacheFinsh:(void(^)())block;

@end
