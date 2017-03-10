//
//  CXPrivate.m
//  CXNetWorking
//
//  Created by mac on 2017/3/10.
//  Copyright © 2017年 enrichment. All rights reserved.
//

#import "CXPrivate.h"

@implementation CXPrivate
+(NSString *)GetKeyWithAppendUrl:(NSString *)url WithParam:(NSDictionary *)dic
{
    NSArray *array = [dic allValues];
    
    NSMutableString * mustr =[NSMutableString string];
    
    for (NSString *str in array) {
        
        if (str.length>6) {
            [str substringToIndex:6];
        }
        
        [mustr appendString:str];
    }
    
    NSString *ss = [NSString stringWithFormat:@"%@%@",url,mustr];
    return ss;


}
@end
