//
//  CXCache.h
//  CXNetWorking
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetStates.h"



@interface CXCache : NSObject
/**
 判断是不是开启了在有网有缓存的状态下的开关
 */
@property(nonatomic,assign)BOOL open;
/**
 缓存的时间
 */
@property(nonatomic,assign)NSInteger inter;
/**
 缓存的时间的key
 */
@property(nonatomic,strong)NSString *timekey;
/**
 存储
 */
-(void)SaveObject:(id)object forKey:(NSString *)key;
/**
 读取
 */
-(id<NSCoding>)readObjectforKey:(NSString *)key;
/**
 清除缓存
 */
-(void)removeCacheforKey:(NSString *)key;
/**
 清除缓存之后的操作
 */
-(void)removeCacheforKey:(NSString *)key finsh:(void(^)(NSString *key))block;

/**
 清除全部的缓存
 */
-(void)removeAllCache;
/**
 移除所有的缓存之后的操作
 */
-(void)removeAllCacheFinsh:(void(^)())block;
/**
 根据key来判断缓存的情况
 */
-(objectType)Obj:(NSString *)key;
@end
