WKWebViewConfiguration *configuration = [self defaultConfiguration];
MKWKWebViewURLSchemeHandler *handle = [MKWKWebViewURLSchemeHandler new];
[configuration setURLSchemeHandler:handle forURLScheme:@"https"];
[configuration setURLSchemeHandler:handle forURLScheme:@"http"];



// MKWKWebViewURLSchemeHandler 实现
@interface MKWKWebViewURLSchemeHandler : NSObject<WKURLSchemeHandler>
- (void)invalidateSession;
@end