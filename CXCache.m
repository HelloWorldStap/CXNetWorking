//
//  CXCache.m
//  CXNetWorking
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXCache.h"
#import "YYCache.h"
#import "CXCacheStrate.h"
@interface CXCache()
@property(nonatomic,strong)YYCache *cash;
@end


@implementation CXCache

-(void)SaveObject:(id<NSCoding>)object forKey:(NSString *)key
{
//    NSLog(@"cache几次----%@--%@",object,key);
    NSDictionary *dic =(NSDictionary *) object;
    
    if (!self.cash) {
        self.cash = [YYCache cacheWithName:key];
    }
    [self.cash setObject:dic forKey:key];
}
-(id<NSCoding>)readObjectforKey:(NSString *)key
{
    
    return [self.cash objectForKey:key];

}
-(objectType)Obj:(NSString *)key
{
    if (!self.cash) {
        self.cash = [YYCache cacheWithName:key];
    }
    
    
    if ([CXCacheStrate NetWorkingEnable]) {
        if (![CXCacheStrate VisionChnage]&&[self.cash containsObjectForKey:key]) {
            
            if (self.open) {
                return objectTypeAlys;
            }else
            {
                if ([CXCacheStrate TimeOut:self.inter withTimeKey:self.timekey]) {
                    return objectTypeYcYn;
                }else
                {
                    return objectTypeNcYn;

                }

            
            }
            
        }else
        {
            return objectTypeNcYn;
        }
        
        
        
    }else
    {
        if ([self.cash containsObjectForKey:key]) {
            return objectTypeYcNn;
        }else
        {
            return objectTypeNcNn;
        }

    }
    
    
    
}
/**
 清除缓存
 */
-(void)removeCacheforKey:(NSString *)key
{
    [self.cash removeObjectForKey:key];
}
/**
 清除全部的缓存
 */
-(void)removeAllCache
{
    [self.cash removeAllObjects];
}
-(void)removeCacheforKey:(NSString *)key finsh:(void(^)(NSString *key))block
{
    [self.cash removeObjectForKey:key withBlock:block];

}
-(void)removeAllCacheFinsh:(void(^)())block
{
    [self.cash removeAllObjectsWithBlock:block];
}
@end
