//
//  NetStates.h
//  CXNetWorking
//
//  Created by mac on 2017/3/8.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#ifndef NetStates_h
#define NetStates_h
typedef NS_ENUM(NSInteger ,objectType)
{
    objectTypeNcNn,//无网无缓存
    objectTypeNcYn,//有网无缓存
    objectTypeYcYn,//有网有缓存（用于长时间不用请求网络）
    objectTypeAlys,//有网有缓存（用于即网络请求又需要缓存）
    objectTypeYcNn//无网有缓存
    
};


#endif /* NetStates_h */
