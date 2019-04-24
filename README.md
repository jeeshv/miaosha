#使用到的技术
明文密码两次MD5处理
JSR303参数校验 & 全局异常处理器

###缓存更新模式
####高性能网站设计之缓存更新的套路
http://blog.csdn.net/tTU1EvLDeLFq5btqiK/article/details/78693323

####分布式SESSION

####实现HandlerMethodArgumentResolver，重写resolveArgument方法，自定义参数解析
 1. WebConfig  extends WebMvcConfigurerAdapter
 2. UserArgumentResolver implements HandlerMethodArgumentResolver 
 
 ####商品ID
 snowflake : Twitter的分布式自增ID算法snowflake (Java版)
 https://www.cnblogs.com/relucent/p/4955340.html
 snowflake生成的ID整体上按照时间自增排序，并且整个分布式系统内不会产生ID碰撞（由datacenter和workerId作区分），并且效率较高。经测试snowflake每秒能够产生26万个ID。
 
 ##扩展
 在理解了这个算法之后，其实还有一些扩展的事情可以做：
 
 根据自己业务修改每个位段存储的信息。算法是通用的，可以根据自己需求适当调整每段的大小以及存储的信息。
 解密id，由于id的每段都保存了特定的信息，所以拿到一个id，应该可以尝试反推出原始的每个段的信息。反推出的信息可以帮助我们分析。比如作为订单，可以知道该订单的生成日期，负责处理的数据中心等等。
 
 ###请问workid具体怎么保证唯一呢，比如我有n个docker，有些docker会挂掉然后重启
 
可以通过分布式缓存来保存机器ID和workid之间的映射关系。启动的时候访问分布式缓存查询当前机器ID对应的workid，如果查询不到则获取一个并保存到分布式缓存中。

###Jmeter压力测试