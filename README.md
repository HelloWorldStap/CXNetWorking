# CXNetWorking
基于YYCache和AFNetworking封装的一个网络请求库
#解决问题
主要解决的是在一个页面中有多个请求并发问题只需要一个加载框进行加载，全部请求完毕之后统一回调。
##CXRequest类
###是一个传递请求参数的类管理了请求的参数和网络请求以及缓存回调的数据
首先通过-(instancetype)initWith:(BOOL)openCache方法来进行初始化并告知该对象要不要对数据进行缓存
appendUrlStr该属性是拼接的参数，param是传入的参数的字典，responseObject是返回的数据可以根据该数据进行界面的处理
headDic请求头设置请求头，RequestType使用什么样的发送请求，NCopen是开启即加载缓存又加载网络请求的类默认是NO，cacheTime是设置缓存多长时间的参数。
#注意：NCopen是 YES的时候是永远的先在缓存中取数据，然后再在网络上取数据，两次取完之后两次刷新，设置为YES之后cacheTime设置无法使用。
##CXConfinger类
###是统一设置的类比如baseurl，使用https的时候使用CertificatesSouce使用证书名称就可以了。还可以设置接收的类型。
##CXBatchNetWorking类
###是对请求进行包装之后发送请求并进行缓存的类直接调用group方法可进行网络的请求
##CXCacheManager类
###管理所存储的缓存的类
提供了根据所请求的拼接的url和传入的参数作为key来清除缓存并提供了清除缓存之后的回调。
#特别注意当request的NCopen开启的时候会回调两次第一次是在缓存中获取的数据，第二次是在网络中获取的数据。

    CXRequest *request = [[CXRequest alloc]initWith:YES];
    request.RequestType =RequestTypeGet;
    request.NCopen = YES;
    request.cacheTime = 20;
    request.appendUrlStr = @"拼接的url";
    request.param = @{@"key":@"value"};
    
    CXRequest *request1 = [[CXRequest alloc]initWith:YES];
    request1.RequestType = RequestTypeGet;
    request1.cacheTime = 8;
    request1.appendUrlStr = @"拼接的url";
    request1.param =@{@"key":@"value"};
    
    
    [CXBatchNetWorking GroupNetWorking:@[request,request1] NetStates:^(objectType type) {
        
    } Success:^(NSArray *resobjarray) {
        CXRequest *request3 = resobjarray[0];
        CXRequest *request4 = resobjarray[1];
    } failure:^(NSError *error) {
        
    }];
