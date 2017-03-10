//
//  CXCacheManager.m
//  CXNetWorking
//
//  Created by mac on 2017/3/9.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXCacheManager.h"
#import "CXCache.h"
#import "CXPrivate.h"
@interface CXCacheManager()
@property(nonatomic,strong)CXCache *cache;
@end

@implementation CXCacheManager
-(CXCache *)cache
{
    if (!_cache) {
        _cache = [[CXCache alloc]init];
    }
    return _cache;
}

/**
 清除缓存
 */
+(void)removeCacheforAppendurl:(NSString *)appaendUrl Withparam:(NSDictionary *)param
{
    CXCacheManager *man = [[CXCacheManager alloc]init];
    NSString *key = [CXPrivate GetKeyWithAppendUrl:appaendUrl WithParam:param];
    [man.cache removeCacheforKey:key];
    
}
/**
 清除缓存之后的操作
 */
+(void)removeCacheforAppendurl:(NSString *)appaendUrl Withparam:(NSDictionary *)param finsh:(void(^)(NSString *key))block
{
    CXCacheManager *man = [[CXCacheManager alloc]init];
    NSString *key = [CXPrivate GetKeyWithAppendUrl:appaendUrl WithParam:param];
    [man.cache removeCacheforKey:key finsh:block];

}
/**
 清除全部的缓存
 */
+(void)removeAllCache
{
    CXCacheManager *man = [[CXCacheManager alloc]init];
    [man.cache removeAllCache];

}
/**
 移除所有的缓存之后的操作
 */
+(void)removeAllCacheFinsh:(void(^)())block
{
    CXCacheManager *man = [[CXCacheManager alloc]init];
    [man.cache removeAllCacheFinsh:block];


}

@end
