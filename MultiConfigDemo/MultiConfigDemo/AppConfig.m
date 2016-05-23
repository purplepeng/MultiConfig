//
//  AppConfig.m
//  bbm2
//
//  Created by PURPLEPENG on 5/8/16.
//  Copyright © 2016 PURPLEPENG. All rights reserved.
//

#import "AppConfig.h"

#if APP_DEVELOPMENT

NSString * const kAppServerURL = @"YourAppServerURL(DEVELOPMENT)";

#else

NSString * const kAppServerURL = @"YourAppServerURL(PRODUCT)";

#endif

#pragma mark -

@implementation AppConfig

+ (NSDictionary *)dictValueOfInfoFile
{
	return [NSBundle mainBundle].infoDictionary;
}

#pragma mark -

+ (NSString *)bundleID
{
    NSDictionary * config = [[self class] dictValueOfInfoFile];
    NSLog(@"config is %@",config);
    return config[@"CFBundleIdentifier"];
}

+ (NSString *)bundleName
{
    NSDictionary * config = [[self class] dictValueOfInfoFile];
    return config[@"CFBundleName"];
}

#pragma mark - 3TH KEY

#pragma mark - 微博
+ (NSString *)WBAPPKey
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
//	NSLog(@"config is %@",config);
	return config[@"WBAPPKey"];
}

+ (NSString *)WBAPPScret
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	return config[@"WBAPPScret"];
}

+ (NSString *)WBRedirectURL
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	NSString * url = [config[@"WBRedirectURL"] stringByReplacingOccurrencesOfString:@"\\" withString:@""];
	return url;
}

#pragma mark - 微信
+ (NSString *)WXAPPID
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	return config[@"WXAPPID"];
}

+ (NSString *)WXAPPScret
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	return config[@"WXAPPScret"];
}

#pragma mark - QQ
+ (NSString *)QQAPPID
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	return config[@"QQAPPID"];
}

#pragma mark - UMeng

+ (NSString *)UMengAppKey
{
	NSDictionary * config = [[self class] dictValueOfInfoFile];
	return config[@"UMengAppKey"];
}

@end
