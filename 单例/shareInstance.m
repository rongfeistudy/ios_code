+(MWCWebResourcePool *)shareInstance {
    static MWCWebResourcePool * single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single =[[MWCWebResourcePool alloc] init];
    }) ;
    return single;
}
