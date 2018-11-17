
#import "JJViewController.h"
#import "UIWebView+TS_JavaScriptContext.h"
#import "JSInterface.h"

@interface JJViewController () <TSWebViewDelegate>
@end

@implementation JJViewController
{
    IBOutlet UIWebView* _webView;
    JSContext * _ctx;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView"
                                             withExtension: @"htm"];
    [_webView loadRequest: [NSURLRequest requestWithURL: htmlURL]];
    _webView.delegate = self;
}
- (void)dealloc {
    NSLog(@"%s",__func__);
}

- (void)webView:(UIWebView *)webView didCreateJavaScriptContext:(JSContext *)ctx
{
    ctx[@"sayHello"] = ^{

        dispatch_async( dispatch_get_main_queue(), ^{

            UIAlertView* av = [[UIAlertView alloc] initWithTitle: @"Hello, World!"
                                                         message: nil
                                                        delegate: nil
                                               cancelButtonTitle: @"OK"
                                               otherButtonTitles: nil];

            [av show];
        });
    };
    ctx[@"viewController"] = [[JSInterface alloc]init];
}

@end
