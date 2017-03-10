//
//  CXRequest.m
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXRequest.h"
#import "CXConfinger.h"
@implementation CXRequest

{
    RequestType _RequestType;
}

-(instancetype)initWith:(BOOL)openCache
{
    if (self = [super init]) {
        
        _openCache = openCache;
        
        self.cacheTime = 0;
        _NCopen = NO;
        self.RequestType = RequestTypeGet;
    }
    return self;
}
-(void)setCacheTime:(NSInteger)cacheTime
{
    _cacheTime = cacheTime;

}
-(void)setRequestType:(RequestType)RequestType
{
    _RequestType = RequestType;
}
//-(RequestType)RequestType
//{
//    if (!_RequestType) {
//        _RequestType = RequestTypeGet;
//    }
//    return _RequestType;
//}
-(CXRequest *(^)(RequestType))LRequestType
{
return ^CXRequest *(RequestType type)
    {
        
        self.RequestType = type;
        return self;
    };
}
-(CXRequest *(^)(NSString *))LappendUrlStr
{
return ^CXRequest *(NSString *url)
    {
        self.appendUrlStr = url;
        
        return self;
    };
}
-(CXRequest *(^)(NSDictionary *))Lparam
{
return ^CXRequest *(NSDictionary *dic)
    {
    
        self.param = dic;
        return self;
    };
}
-(CXRequest *(^)(NSDictionary<NSString *,NSString *> *))LheadDic
{
return ^CXRequest *(NSDictionary<NSString *,NSString *>*dic)
    {
    
        self.headDic = dic;
        return self;
    };

}
-(CXRequest *(^)(NSInteger))LcacheTime;
{
return ^CXRequest *(NSInteger cachetime)
    {
        self.cacheTime = cachetime;
        return self;
    };

}
-(CXRequest *(^)(BOOL))LopenCache;
{

return ^CXRequest *(BOOL opencache)
    {
        _openCache = opencache;
        return self;
    };
}
-(CXRequest *(^)(BOOL))LNCopen
{
return ^CXRequest *(BOOL ncopen)
    {
    
        self.NCopen = ncopen;
        return self;
    };

}
@end
