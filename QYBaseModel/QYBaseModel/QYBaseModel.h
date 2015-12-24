//
//  BaseModel.h
//  
//
//  Created by wxhl on 14-10-14.
//  Copyright (c) 2014年 千叶 All rights reserved.
//
//  注意：NSString 类型无法用NSNumber接受

#import <Foundation/Foundation.h>

@interface QYBaseModel : NSObject

//// 同过外部传入的字典生成映射字典，也就是取外部字典的key值为映射字典的key，model的属性的作为value
//- (NSDictionary *)attributesMapDictionary:(NSDictionary *)jsonDic;

// 自定义初始化
- (id)initContentWithDic:(NSDictionary *)dic;

// 为model属性赋值
- (void)setAttributes:(NSDictionary *)jsonDic;

@end
