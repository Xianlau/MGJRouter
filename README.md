# MGJRouterDemo

#### 使用：


1. 在DemoDetailViewController的+load方法中初始化了DemoListViewController中的titleWithHandlers字典。
2. 然后在handler block中返回了UIViewController。然后在block中定义了selector的方法，然后在进入DemoDetailViewController页面的时候就调用这个selector。
3. 在DemoDetailViewController的demos中写了所有的MGJRouter的使用方法。



#### 源码解读：


