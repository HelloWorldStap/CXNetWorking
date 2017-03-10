//
//  CXConfinger.m
//  CXNetWorking
//
//  Created by mac on 2017/3/6.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXConfinger.h"

@implementation CXConfinger
+(CXConfinger *)shareInstype
{
    static id CXConfinger = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CXConfinger = [[self alloc] init];

    });

    return CXConfinger;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.acceptableContentTypes =[NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript",@"text/html",@"text/xml",@"text/plain",@"Content-Type",@"charset",@"HTTP.UTF_8",nil];
        
        self.timeoutInterval = 10;
        

    }
    return self;
}

-(void)setAcceptableContentTypes:(NSSet *)acceptableContentTypes
{
    _acceptableContentTypes = acceptableContentTypes;
}
-(void)setTimeoutInterval:(NSInteger)timeoutInterval
{
    _timeoutInterval = timeoutInterval;
}
@end
