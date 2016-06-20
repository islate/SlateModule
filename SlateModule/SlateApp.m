//
//  SlateApp.m
//  SlateCore
//
//  Created by linyize on 16/3/28.
//  Copyright © 2016年 islate. All rights reserved.
//

#import "SlateApp.h"

@interface SlateApp ()

@property (nullable, nonatomic, strong) NSMutableArray<id<SlateModule>> *modules;

@end

@implementation SlateApp

- (instancetype)init
{
    self = [super init];
    if (self) {
        _modules = [NSMutableArray new];
    }
    return self;
}

#pragma mark 模块机制

- (void)addModules:(nonnull NSArray<id<SlateModule>>*)modules
{
    [_modules addObjectsFromArray:modules];
}

- (void)applyModulesWithBlock:(void(^)(id<SlateModule> module))block
{
    if (!block) {
        return;
    }
    for (id module in _modules) {
        block(module);
    }
}

- (BOOL)boolForApplyModulesWithBlock:(BOOL(^)(id<SlateModule> module))block
{
    if (!block) {
        return NO;
    }
    BOOL res = NO;
    for (id module in _modules) {
        res = block(module);
        if (res) {
            return YES;
        }
    }
    return res;
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(nonnull UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application willFinishLaunchingWithOptions:launchOptions];
        }
    }];
    return YES;
}

- (BOOL)application:(nonnull UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }];
    return YES;
}

- (void)applicationDidBecomeActive:(nonnull UIApplication *)application
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidBecomeActive:application];
        }
    }];
}

- (void)applicationWillResignActive:(nonnull UIApplication *)application
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillResignActive:application];
        }
    }];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    return [self boolForApplyModulesWithBlock:^BOOL(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            return [module application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
        return NO;
    }];
}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application      // try to clean up as much memory as possible. next step is to terminate app
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidReceiveMemoryWarning:application];
        }
    }];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillTerminate:application];
        }
    }];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken NS_AVAILABLE_IOS(3_0)
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error NS_AVAILABLE_IOS(3_0)
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0)
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveRemoteNotification:userInfo];
        }
    }];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification NS_AVAILABLE_IOS(4_0) __TVOS_PROHIBITED
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didReceiveLocalNotification:notification];
        }
    }];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application didRegisterUserNotificationSettings:notificationSettings];
        }
    }];
}

- (void)applicationDidEnterBackground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationDidEnterBackground:application];
        }
    }];
}

- (void)applicationWillEnterForeground:(UIApplication *)application NS_AVAILABLE_IOS(4_0)
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module applicationWillEnterForeground:application];
        }
    }];
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(NSDictionary *)userInfo reply:(void (^)(NSDictionary *))reply
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application handleWatchKitExtensionRequest:userInfo reply:reply];
        }
    }];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    [self applyModulesWithBlock:^(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            [module application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }];
}

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType
{
    return [self boolForApplyModulesWithBlock:^BOOL(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            return [module application:application willContinueUserActivityWithType:userActivityType];
        }
        return NO;
    }];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler
{
    return [self boolForApplyModulesWithBlock:^BOOL(id<SlateModule> module) {
        if ([module respondsToSelector:_cmd]) {
            return [module application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
        }
        return NO;
    }];
}

@end
