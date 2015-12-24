//
//  AvatarModel.m
//  QYBaseModel
//
//  Created by qianye on 15/12/24.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "AvatarModel.h"

@implementation AvatarModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"small:%@\nlarge:%@\nmedium:%@\n",_small,_large,_medium];
}

@end
