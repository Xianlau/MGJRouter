# MGJRouterDemo

#### 使用：


1. 在DemoDetailViewController的+load方法中初始化了DemoListViewController中的titleWithHandlers字典。
2. 然后在handler block中返回了UIViewController。然后在block中定义了selector的方法，然后在进入DemoDetailViewController页面的时候就调用这个selector。
3. 在DemoDetailViewController的demos中写了所有的MGJRouter的使用方法。



#### 源码解读：


注册URL

```

+ (void)registerURLPattern:(NSString *)URLPattern toHandler:(MGJRouterHandler)handler
//会存在一个全局的可变字典self.routes中；
//NSMutableDictionary* subRoutes = self.routes，此处的self.routes和subRoutes是同一个内存地址的。
//所以添加在subRoutes中的和self.routes是一样的。

格式：
{
    mgj =     {
        "_" = "<__NSMallocBlock__: 0x600000c97240>";
        category =         {
            travel =             {
                "_" = "<__NSMallocBlock__: 0x600000c97b40>";
            };
        };
        detail =         {
            "_" = "<__NSGlobalBlock__: 0x1041116b0>";
        };
        foo =         {
            bar =             {
                "_" = "<__NSMallocBlock__: 0x600000ca9b60>";
                none =                 {
                    exists =                     {
                        "_" = "<__NSMallocBlock__: 0x600000c97cf0>";
                    };
                };
            };
        };
        search =         {
            ":query" =             {
                "_" = "<__NSMallocBlock__: 0x600000c96160>";
            };
        };
        "search_top_bar" =         {
            "_" = "<__NSGlobalBlock__: 0x1041117c0>";
        };
        "~" =         {
            "_" = "<__NSMallocBlock__: 0x600000c96130>";
        };
    };
}


```

打开URL

```
+ (void)openURL:(NSString *)URL withUserInfo:(NSDictionary *)userInfo completion:(void (^)(id result))completion

//根据URL从self.routes中取出之前的parameters和block并且调用block()。
//其中返回匹配的参数的时候借鉴了HHRouter的思路(https://github.com/Huohua/HHRouter)


```

