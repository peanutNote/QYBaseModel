//
//  QYModel.h
//  QYBaseModel
//
//  Created by qianye on 15/12/24.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "QYBaseModel.h"
@class AvatarModel;

@interface QYModel : QYBaseModel

@property (copy, nonatomic) NSString *alt;

@property (copy, nonatomic) NSString *gender;

@property (copy, nonatomic) NSString *name_en;

@property (copy, nonatomic) NSString *born_place;

@property (strong, nonatomic) NSArray *works;

// 因为json中得id为关键字，这里需要更改然后在init方法中赋值
@property (copy, nonatomic) NSString *actorId;

@property (copy, nonatomic) NSString *name;

@property (copy, nonatomic) NSString *mobile_url;

@property (strong, nonatomic) AvatarModel *avatars;
@end
