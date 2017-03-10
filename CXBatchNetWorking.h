//
//  CXBatchNetWorking.h
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetStates.h"
@class CXRequest;
@interface CXBatchNetWorking : NSObject
/**
 多个请求并发开始请求
 根据返回的netstates的状态进行无网络和有无缓存的加载
 */
+(void)GroupNetWorking:(NSArray<CXRequest *>*)array
             NetStates:(void(^)(objectType type))netStates
               Success:(void(^)(NSArray *resobjarray))success
               failure:(void(^)(NSError *error))failure;

/**
 单个请求
 */
+(void)AloneNetWorking:(CXRequest *)request
        NetStates:(void(^)(objectType type))netStates
        Success:(void(^)(NSArray *resobjarray))success
        failure:(void(^)(NSError *error))failure;



//- (instancetype)init NS_UNAVAILABLE;
//+ (instancetype)new NS_UNAVAILABLE;

@end
