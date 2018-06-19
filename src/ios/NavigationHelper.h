#import <Cordova/CDVPlugin.h>

@interface NavigationHelper : CDVPlugin

@property (nonatomic, copy) NSString *callbackId;

- (void)baiduCheck:(CDVInvokedUrlCommand*)command;

- (void)baiduAddress:(CDVInvokedUrlCommand*)command;

- (void)baiduPosition:(CDVInvokedUrlCommand*)command;

- (void)gaodeCheck:(CDVInvokedUrlCommand*)command;

- (void)gaodeAddress:(CDVInvokedUrlCommand*)command;

- (void)gaodePosition:(CDVInvokedUrlCommand*)command;

- (void)tencentCheck:(CDVInvokedUrlCommand*)command;

- (void)tencentAddress:(CDVInvokedUrlCommand*)command;

- (void)tencentPosition:(CDVInvokedUrlCommand*)command;

@end