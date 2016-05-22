//
//  AppConfig.h
//  bbm2
//
//  Created by PURPLEPENG on 5/8/16.
//  Copyright © 2016 PURPLEPENG. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_DEVELOPMENT 0

FOUNDATION_EXPORT NSString * const kAppServerURL;

#pragma mark -

@interface AppConfig : NSObject

#pragma mark - 3TH KEY

#pragma mark - 微博
+ (NSString *)WBAPPKey;
+ (NSString *)WBAPPScret;
+ (NSString *)WBRedirectURL;

#pragma mark - 微信
+ (NSString *)WXAPPID;
+ (NSString *)WXAPPScret;

#pragma mark - QQ
+ (NSString *)QQAPPID;

#pragma mark - UMeng
+ (NSString *)UMengAppKey;

@end
