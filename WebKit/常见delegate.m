@interface MKWebView () <WKNavigationDelegate, WKUIDelegate>

// 设置delegate
[_webview setNavigationDelegate:self];
[_webview setUIDelegate:self];