- (NSURLResponse *)nativeForWKWebViewDataWithFilePath:(NSString *)filePath dataLenght:(NSInteger)dataLenght url:(NSURL *)url {
    NSString *ext = [[filePath pathExtension] lowercaseString];
    //设置请求头，必须设置请求可以跨域，负责
    NSMutableDictionary *allHttpHeadersFields = [NSMutableDictionary dictionary];
    [allHttpHeadersFields setString:@"*" forKey:@"Access-Control-Allow-Origin"];
    if ([ext isNotEmpty]) {
        NSString *mimeType = nil;
        if ([ext isEqualToString:@"css"]) {
            mimeType = @"text/css";
        } else {
            NSString *UTI = (NSString *)CFBridgingRelease(UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)ext, NULL));
            mimeType = (NSString *)CFBridgingRelease(UTTypeCopyPreferredTagWithClass((__bridge CFStringRef)UTI, kUTTagClassMIMEType));
        }
        if ([mimeType isNotEmpty]) {
            [allHttpHeadersFields setString:mimeType forKey:@"Content-Type"];
        }
    }
    [allHttpHeadersFields setString:[NSString stringWithFormat:@"%li",dataLenght] forKey:@"Content-Length"];
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:url statusCode:200 HTTPVersion:@"HTTP/1.1" headerFields:[allHttpHeadersFields copy]];
//    NSLog(@"=======****===**===使用了本地资源===%@====",url.absoluteString);
    return response;
}