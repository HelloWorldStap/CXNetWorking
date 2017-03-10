//
//  CXRequest.h
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, RequestType)
{
    RequestTypePost,
    RequestTypeGet

};

@interface CXRequest : NSObject


-(instancetype)initWith:(BOOL)openCache;

/**
 是不是网络和缓存同时都要(如果两种都需要的话，那么可能会回调两次)永远的缓存这种情况下cachetime将失去作用次属性适用于网络请求和缓存同时具备若只想缓存那么设置成NO并设置cacahtime（默认是No）
 */
@property(nonatomic,assign)BOOL NCopen;
/**
 可以根据这个设置缓存时间
 */
@property(nonatomic,assign)NSInteger cacheTime;
/**
 是不是开启缓存若是no的话不开启缓存设置缓存时间也没用,开启缓存是一个大的前提
 */
@property(nonatomic,assign,readonly)BOOL openCache;




/**
 请求的类型(默认是get)
 */
@property(nonatomic,assign)RequestType RequestType;
/**
 拼接进去的url
 */
@property(nonatomic,strong)NSString *appendUrlStr;
/**
 传入的参数的字典
 */
@property(nonatomic,strong)NSDictionary *param;
/**
 返回的数据
 */
@property(nonatomic,strong)id responseObject;
/**
 请求的请求头
 */
@property(nonatomic,strong)NSDictionary <NSString *,NSString *>*headDic;
/**************************下面是链试调用***************************/

-(CXRequest *(^)(RequestType))LRequestType;
-(CXRequest *(^)(NSString *))LappendUrlStr;
-(CXRequest *(^)(NSDictionary *))Lparam;
-(CXRequest *(^)(NSDictionary<NSString *,NSString *> *))LheadDic;
-(CXRequest *(^)(NSInteger))LcacheTime;
//-(CXRequest *(^)(BOOL))LopenCache;
-(CXRequest *(^)(BOOL))LNCopen;


- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
