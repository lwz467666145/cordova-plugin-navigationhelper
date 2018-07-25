#import "NavigationHelper.h"
#import <Cordova/CDV.h>

@interface NavigationHelper ()

@end

@implementation NavigationHelper

- (void)baiduCheck:(CDVInvokedUrlCommand *)command{
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]];
    NSString *result = flag ? @"true" : @"false";
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result] callbackId:command.callbackId];
}

- (void)baiduAddress:(CDVInvokedUrlCommand *)command{
    NSString *address = command.arguments[0];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]];
    if (flag) {
        NSString *identifier = NSBundle.mainBundle.infoDictionary[@"CFBundleIdentifier"];
        NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/geocoder?address=%@&src=%@", address, identifier] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

- (void)baiduPosition:(CDVInvokedUrlCommand *)command{
    NSString *longitude = command.arguments[0];
    NSString *latitude = command.arguments[1];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"baidumap://"]];
    if (flag) {
        NSString *identifier = NSBundle.mainBundle.infoDictionary[@"CFBundleIdentifier"];
        NSString *urlString = [NSString stringWithFormat:@"baidumap://map/geocoder?location=%@,%@&coord_type=gcj02&src=%@", latitude, longitude, identifier];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

- (void)gaodeCheck:(CDVInvokedUrlCommand *)command{
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]];
    NSString *result = flag ? @"true" : @"false";
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result] callbackId:command.callbackId];
}

- (void)gaodeAddress:(CDVInvokedUrlCommand *)command{
    NSString *address = command.arguments[0];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]];
    if (flag) {
        NSString *identifier = NSBundle.mainBundle.infoDictionary[@"CFBundleIdentifier"];
        NSString *urlString = [[NSString stringWithFormat:@"iosamap://poi?sourceApplication=%@&name=%@", identifier, address] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

- (void)gaodePosition:(CDVInvokedUrlCommand *)command{
    NSString *name = command.arguments[0];
    NSString *longitude = command.arguments[1];
    NSString *latitude = command.arguments[2];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"iosamap://"]];
    if (flag) {
        NSString *identifier = NSBundle.mainBundle.infoDictionary[@"CFBundleIdentifier"];
        NSString *urlString = [[NSString stringWithFormat:@"iosamap://viewMap?sourceApplication=%@&poiname=%@&lat=%@&lon=%@", identifier, name, latitude, longitude] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

- (void)tencentCheck:(CDVInvokedUrlCommand *)command{
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]];
    NSString *result = flag ? @"true" : @"false";
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result] callbackId:command.callbackId];
}

- (void)tencentAddress:(CDVInvokedUrlCommand *)command{
    NSString *address = command.arguments[0];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]];
    if (flag) {
        NSString *tencentKey = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"NavigationHelper"] objectForKey:@"TENCENT_KEY"];
        NSString *urlString = [[NSString stringWithFormat:@"qqmap://map/search?keyword=%@&referer=%@", address, tencentKey] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

- (void)tencentPosition:(CDVInvokedUrlCommand *)command{
    NSString *longitude = command.arguments[0];
    NSString *latitude = command.arguments[1];
    Boolean flag = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"qqmap://"]];
    if (flag) {
        NSString *tencentKey = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"NavigationHelper"] objectForKey:@"TENCENT_KEY"];
        NSString *urlString = [NSString stringWithFormat:@"qqmap://map/geocoder?coord=%@,%@&referer=%@", latitude, longitude, tencentKey];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    } else
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Not Installed"] callbackId:command.callbackId];
}

@end
