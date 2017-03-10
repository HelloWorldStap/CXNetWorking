//
//  CXBatchNetWorking.m
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//appendUrl

#import "CXBatchNetWorking.h"
#import "CXRequest.h"
#import "CXBaseNetWorking.h"
#import "CXCache.h"
#import "CXPrivate.h"
typedef void(^netstates) (objectType type);
typedef void(^SuccessBlock) (NSArray<CXRequest*> *array);
@interface CXBatchNetWorking()
@property(nonatomic,assign)NSInteger networkCount;
@property(nonatomic,strong)SuccessBlock block;
@property(nonatomic,strong)netstates netstatesBlock;
@property(nonatomic,strong)NSMutableDictionary<NSURLSessionDataTask *,CXRequest *> *dic;
@property(nonatomic,strong)CXCache *cxcash;
@end

@implementation CXBatchNetWorking
-(CXCache *)cxcash
{
    if (!_cxcash) {
        _cxcash = [[CXCache alloc]init];
    }
    return _cxcash;
}
-(NSMutableDictionary<NSURLSessionDataTask *,CXRequest *> *)dic
{
    if (!_dic) {
        _dic = [NSMutableDictionary dictionary];
    }
    return _dic;
}

+(void)GroupNetWorking:(NSArray<CXRequest *>*)array
             NetStates:(void(^)(objectType type))netStates
               Success:(void(^)(NSArray *resobjarray))success
               failure:(void(^)(NSError *error))failure;
{
    CXBatchNetWorking *net = [[CXBatchNetWorking alloc]init];
    net.netstatesBlock = netStates;
    net.networkCount = array.count;
    net.block = success;
    for (NSInteger i=0; i<array.count; i++) {
        CXRequest *request = array[i];
        net.cxcash.inter = request.cacheTime;
        net.cxcash.timekey = request.appendUrlStr;
        net.cxcash.open = request.NCopen;
        objectType type = [net.cxcash Obj:[CXPrivate GetKeyWithAppendUrl:request.appendUrlStr WithParam:request.param]];
        if (type==objectTypeYcYn)
        {
                [net resobject:net WithRequest:request];
                [net CschewithArray:array with:net];
                netStates(objectTypeYcYn);
        }else if (type==objectTypeNcYn)
        {
        netStates(objectTypeNcYn);
        [net request:request With:net faile:failure WithArray:array];
        }else if (type==objectTypeYcNn)
        {
            netStates(objectTypeYcNn);
            [net resobject:net WithRequest:request];
            [net CschewithArray:array with:net];
        }else if (type==objectTypeNcNn)
        {
            netStates(objectTypeNcNn);
        }else if (type ==objectTypeAlys)
        {
            [net resobject:net WithRequest:request];
            [net CschewithArray:array with:net];
            netStates(objectTypeYcYn);
            [net request:request With:net faile:failure WithArray:array];
        }
    }
}
-(void)request:(CXRequest *)request With:(CXBatchNetWorking *)net faile:(void(^)(NSError *))failure WithArray:(NSArray<CXRequest *>*)array
{
    NSURLSessionDataTask *alltask;
    if (request.RequestType==RequestTypePost) {
        alltask =[net PostNetworking:request faile:failure withNet:net witharray:array];
    }else
    {
        alltask =[net Getnetworking:request faile:failure withNet:net witharray:array];
    }
    [net.dic setObject:request forKey:alltask];
}
-(NSURLSessionDataTask *)PostNetworking:(CXRequest *)request faile:(void(^)(NSError *))failure withNet:(CXBatchNetWorking *)net witharray:(NSArray <CXRequest *>*)array
{
   NSURLSessionDataTask *task = [CXBaseNetWorking POST:request.appendUrlStr parameters:request.param head:request.headDic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * responseData=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        [net CXNet:task response:responseData with:net withArray:array];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
    return task;
}
-(NSURLSessionDataTask *)Getnetworking:(CXRequest *)request faile:(void(^)(NSError *))failure withNet:(CXBatchNetWorking *)net witharray:(NSArray <CXRequest *>*)array
{
   NSURLSessionDataTask *task = [CXBaseNetWorking GET:request.appendUrlStr parameters:request.param head:request.headDic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary * responseData=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
        [net CXNet:task response:responseData with:net withArray:array];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        failure(error);
    }];
    return task;
}
-(void)CXNet:(NSURLSessionDataTask *)task response:(id)responseObject with:(CXBatchNetWorking *)net withArray:(NSArray <CXRequest *>*)array
{
    CXRequest *reques = [net.dic objectForKey:task];
    if (reques.openCache&&responseObject!=nil) {
        [net.cxcash SaveObject:responseObject forKey:[CXPrivate GetKeyWithAppendUrl:reques.appendUrlStr WithParam:reques.param]];
    }
    reques.responseObject = nil;
    reques.responseObject = responseObject;
    net.networkCount=net.networkCount-1;
    if (net.networkCount==0) {
        net.block(array);
    }
}
-(void)resobject:(CXBatchNetWorking *)net WithRequest:(CXRequest *)request
{
    id resobject = [net.cxcash readObjectforKey:[CXPrivate GetKeyWithAppendUrl:request.appendUrlStr WithParam:request.param]];
    request.responseObject = nil;
    request.responseObject = resobject;
}
-(void)CschewithArray:(NSArray <CXRequest *>*)array with:(CXBatchNetWorking *)net
{
    net.networkCount=net.networkCount-1;
    if (net.networkCount==0) {
        net.block(array);
        for (NSInteger i=0; i<array.count; i++) {
            CXRequest *request = array[i];
            if (request.NCopen) {
                net.networkCount = net.networkCount+1;
            }
        }
    }
}

+(void)AloneNetWorking:(CXRequest *)request
             NetStates:(void(^)(objectType type))netStates
               Success:(void(^)(NSArray *resobjarray))success
               failure:(void(^)(NSError *error))failure
{
    [self GroupNetWorking:@[request] NetStates:netStates Success:success failure:failure];
}


@end
