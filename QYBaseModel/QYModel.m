//
//  QYModel.m
//  QYBaseModel
//
//  Created by qianye on 15/12/24.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "QYModel.h"

#import "WorkModel.h"
#import "AvatarModel.h"

@implementation QYModel

- (id)initContentWithDic:(NSDictionary *)dic
{
    if (self = [super initContentWithDic:dic]) {
        // 解析works，以及avatars,为actorId赋值
        self.actorId = dic[@"id"];
        
        NSMutableArray *workModels = [NSMutableArray array];
        for (NSDictionary *workDict in _works) {
            WorkModel *workModel = [[WorkModel alloc] initContentWithDic:workDict];
            [workModels addObject:workModel];
        }
        self.works = workModels;
        
        self.avatars = [[AvatarModel alloc] initContentWithDic:dic[@"avatars"]];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"alt:%@\ngender:%@\nname_en:%@\nborn_place:%@\nworks:%@\nactorId:%@\nname:%@\nmobile_url:%@\navatars:%@\n",_alt,_gender,_name_en,_born_place,_works,_actorId,_name,_mobile_url,_avatars];
}

@end
