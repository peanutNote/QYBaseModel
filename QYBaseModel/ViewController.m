//
//  ViewController.m
//  QYBaseModel
//
//  Created by qianye on 15/12/24.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "ViewController.h"
#import "QYModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 模拟网络加载数据
    [self loadData];
   
}

- (void)loadData
{
    // 加载本地json文件
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"actor" ofType:@".json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:NULL];
    
    // 解析数据模型
    QYModel *qyModel = [[QYModel alloc] initContentWithDic:jsonDict];
    NSLog(@"%@",qyModel);
}


@end
