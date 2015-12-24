##QYBaseModel
* The easy way to parse *json*
* 简单易用的数据模型解析工具

##如何使用QYBaseModel
* 将QYBaseModel导入项目，因为该文件不支持arc所以需要在*Build Phases*-*Compile Sourcese*-*QYBaseModel.m*文件后面添加“-fno-objc-arc”
* 新建model数据模型的时候继承QYBaseModel即可

##使用注意
* 如果json数据中有字段为关键字的时候，可以再model中自定义属性名，然后在在model.m中重写父类`- (id)initContentWithDic:`方法在这里为该方法赋值
* 如果json中还有数组或者字典则可以用类此的方法继续解析

```objc
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
```
