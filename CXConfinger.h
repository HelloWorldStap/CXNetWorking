//
//  CXConfinger.h
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CXConfinger : NSObject
+(CXConfinger *)shareInstype;
/**
 基础的url后面需要拼接详细的url
 */
@property(nonatomic,strong)NSString *baseUrl;
/**
 接收的数据类型
 */
@property(nonatomic,strong)NSSet *acceptableContentTypes;
/**
 证书的名字（iOS 默认是cer的证书，CertificatesSouce只需要填写证书的名字）
 如果填写了该字段默认开启https的请求baseurl需要修改成https的请求
 */
@property(nonatomic,strong)NSString *CertificatesSouce;
/**
 请求超时的时间
 */
@property(nonatomic,assign)NSInteger timeoutInterval;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
@end
