//
//  JSInterface.m
//  testWebViewJSC
//
//  Created by 陈培爵 on 2018/11/18.
//  Copyright © 2018年 CoDeveloper, LLC. All rights reserved.
//

#import "JSInterface.h"
@protocol JavaScriptDelegate <JSExport>
- (void) sayGoodbye;
@end
@interface JSInterface() <JavaScriptDelegate>

@end
@implementation JSInterface

- (void) sayGoodbye
{
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView* av = [[UIAlertView alloc] initWithTitle: @"Goodbye, World!"
                                                         message: nil
                                                        delegate: nil
                                               cancelButtonTitle: @"OK"
                                               otherButtonTitles: nil];
            
            [av show];
        });
    }
    
    
}
@end
