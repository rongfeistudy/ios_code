WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
WKUserContentController *content = [[WKUserContentController alloc] init];
configuration.userContentController = content;
configuration.allowsInlineMediaPlayback = YES;
configuration.processPool = [[self class] sharedWKPool];
configuration.mediaPlaybackRequiresUserAction = NO;
configuration.requiresUserActionForMediaPlayback = NO;
configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypeNone;

NSString *src = @"https://test-s.immomo.com/fep/momo/m-fes-sdk/fdt-devtools/fdt-devtools-min.js";
NSString *defaultStr = [NSString stringWithFormat:@"if(!document.getElementsByName('fdt-devtools')[0]){\n var devtools=document.createElement('script');\n devtools.setAttribute('type','text/javascript'); \n devtools.setAttribute('name','fdt-devtools'); \n devtools.src='%@';\n document.head.appendChild(devtools);\n }",src];
[configuration.userContentController addUserScript:[[WKUserScript alloc] initWithSource:defaultStr injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES]];