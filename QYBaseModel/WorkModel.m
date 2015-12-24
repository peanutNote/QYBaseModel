//
//  WorkModel.m
//  QYBaseModel
//
//  Created by qianye on 15/12/24.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "WorkModel.h"

@implementation WorkModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"roles:%@\nsubject:%@\n",_roles,_subject];
}

@end
