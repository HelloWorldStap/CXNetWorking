//
//  CXBaseNetWorking.m
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXBaseNetWorking.h"
#import "AFNetworking.h"
#import "CXConfinger.h"
@implementation CXBaseNetWorking
+(NSURLSessionDataTask *)POST:(NSString *)urlStr
                   parameters:(id)parameter
                         head:(NSDictionary <NSString *,NSString *>*)headDic
                      success:(void(^)(NSURLSessionDataTask * task, id responseObject))success
                      failure:(void(^)(NSURLSessionDataTask *task,NSError *  error))failure;
{
    
    AFHTTPSessionManager *manager =  [self GETManager];
    NSString *allurl = [NSString stringWithFormat:@"%@%@",[CXConfinger shareInstype].baseUrl,urlStr];
        if (headDic!=nil) {
        NSString *key = headDic.allKeys[0];
        NSString *value = headDic.allValues[0];
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];

    }
    
   NSURLSessionDataTask *task = [manager POST:allurl parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:success failure:failure];
    return task;
}
+(NSURLSessionDataTask *)GET:(NSString *)urlStr
                  parameters:(id)parameter
                        head:(NSDictionary <NSString *,NSString *>*)headDic
                     success:(void(^)(NSURLSessionDataTask * task, id responseObject))success
                     failure:(void(^)(NSURLSessionDataTask *task,NSError *  error))failure;
{
    AFHTTPSessionManager *manager =  [self GETManager];
    NSString *allurl = [NSString stringWithFormat:@"%@%@",[CXConfinger shareInstype].baseUrl,urlStr];
    if (headDic!=nil) {
        NSString *key = headDic.allKeys[0];
        NSString *value = headDic.allValues[0];
        [manager.requestSerializer setValue:value forHTTPHeaderField:key];
        
    }
   NSURLSessionDataTask *task =  [manager GET:allurl parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:success failure:failure];
    return task;


}

/**
 根据证书的地址获取证书
 */
+(AFSecurityPolicy *)GETSecurityPolicy
{
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:[CXConfinger shareInstype].CertificatesSouce ofType:@"cer"];
    
    NSData * certData =[NSData dataWithContentsOfFile:cerPath];
    NSSet * certSet = [[NSSet alloc] initWithObjects:certData, nil];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 是否允许,NO-- 不允许无效的证书
    [securityPolicy setAllowInvalidCertificates:YES];
    [securityPolicy setValidatesDomainName:NO];  // 是否在证书域字段中验证域名
    [securityPolicy setPinnedCertificates:certSet];

    return securityPolicy;

}
/**
 获得manager
 */
+(AFHTTPSessionManager *)GETManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [CXConfinger shareInstype].acceptableContentTypes;
    
    manager.requestSerializer.timeoutInterval = [CXConfinger shareInstype].timeoutInterval;
    if ([CXConfinger shareInstype].CertificatesSouce&&[CXConfinger shareInstype].CertificatesSouce.length>0&&![[CXConfinger shareInstype].CertificatesSouce isEqualToString:@""]) {
        
        AFSecurityPolicy *  securityPolicy =[self GETSecurityPolicy];
        manager.securityPolicy = securityPolicy;
//        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        
    }
    
    return manager;
}
@end
