//
//  QYBaseModel.m
//  
//
//  Created by qianye on 14-10-14.
//  Copyright (c) 2014年 千叶 All rights reserved.
//

#import "QYBaseModel.h"

@implementation QYBaseModel

// 自定义初始化
- (id)initContentWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setAttributes:dic];
    }
    return self;
}

// 为model属性赋值
- (void)setAttributes:(NSDictionary *)jsonDic
{
    // 生成映射字典
    NSDictionary *mapDic = [self attributesMapDictionary:jsonDic];
    // 循环遍历映射字典的key 为model属性赋值
    for (NSString *jsonKey in mapDic) {
        // 取得model的属性值，映射字典的value
        NSString *arrtValue = mapDic[jsonKey];
        // 取得set方法
        SEL action = [self stringToSEL:arrtValue];
        // 判断set是否实现
        if ([self respondsToSelector:action]) {
            // 取得json中的值
            id jsonValue = jsonDic[jsonKey];
            // 判断json中的值是否有空值
            if ([jsonValue isKindOfClass:[NSNull class]] || jsonValue == nil) {
                jsonValue = @"";
            }
            //获得类和方法的签名
            NSMethodSignature *signature = [self methodSignatureForSelector:action];
            
            //从签名获得调用对象
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            //设置target
            [invocation setTarget:self];
            
            //设置selector
            [invocation setSelector:action];
            
            // 设置参数 index从2开始 ，原因为：0 1 两个参数已经被target 和selector占用
            [invocation setArgument:&jsonValue atIndex:2];
            
            //调用 
            [invocation invoke];
        }
    }
}

// 通过model属性值，也即映射字典的value生成set方法
- (SEL)stringToSEL:(NSString *)attributesName
{
    // 同过映射字典的value值来生成set方法
    // set后面第一个字母大写
    NSString *firstStr = [[attributesName substringToIndex:1] uppercaseString];
    // 出去第一个大写  后面照抄
    NSString *endStr = [attributesName substringFromIndex:1];
    // 拼接set方法名
    NSString *setterMethod = [NSString stringWithFormat:@"set%@%@:",firstStr,endStr];
    // 通过set方法名生成 set方法
    SEL setter = NSSelectorFromString(setterMethod);
    return setter;
}

// 同过外部传入的字典生成映射字典，也就是取外部字典的key值为映射字典的key，model的属性的作为value
- (NSDictionary *)attributesMapDictionary:(NSDictionary *)jsonDic
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    // 生成映射字典
    for (id jsonKey in jsonDic) {
        [dic setObject:jsonKey forKey:jsonKey];
    }
    return [dic autorelease];
}


@end
