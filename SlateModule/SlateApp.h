//
//  SlateApp.h
//  SlateCore
//
//  Created by linyize on 16/3/28.
//  Copyright © 2016年 islate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol SlateModule;

@interface SlateApp : UIResponder <UIApplicationDelegate>

@property (nullable, nonatomic, strong) UIWindow *window;

- (void)addModules:(nonnull NSArray<id<SlateModule>>*)modules;

@end


@protocol SlateModule <NSObject>

@optional
- (BOOL)application:(nonnull UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0);
- (BOOL)application:(nonnull UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0);

- (void)applicationDidBecomeActive:(nonnull UIApplication *)application;
- (void)applicationWillResignActive:(nonnull UIApplication *)application;

- (BOOL)application:(nonnull UIApplication *)application openURL:(nullable NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nullable id)annotation NS_DEPRECATED_IOS(4_2, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED;
- (void)applicationDidReceiveMemoryWarning:(nonnull UIApplication *)application;      // try to clean up as much memory as possible. next step is to terminate app

- (void)applicationWillTerminate:(nonnull UIApplication *)application;

- (void)application:(nonnull UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nullable NSData *)deviceToken NS_AVAILABLE_IOS(3_0);
- (void)application:(nonnull UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(nullable NSError *)error NS_AVAILABLE_IOS(3_0);
- (void)application:(nonnull UIApplication *)application didReceiveRemoteNotification:(nullable NSDictionary *)userInfo NS_AVAILABLE_IOS(3_0);
- (void)application:(nonnull UIApplication *)application didReceiveLocalNotification:(nullable UILocalNotification *)notification NS_AVAILABLE_IOS(4_0) __TVOS_PROHIBITED;

- (void)application:(nonnull UIApplication *)application didRegisterUserNotificationSettings:(nullable UIUserNotificationSettings *)notificationSettings;

- (void)applicationDidEnterBackground:(nonnull UIApplication *)application NS_AVAILABLE_IOS(4_0);
- (void)applicationWillEnterForeground:(nonnull UIApplication *)application NS_AVAILABLE_IOS(4_0);

- (void)application:(nonnull UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply NS_AVAILABLE_IOS(8_2);

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED;

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType NS_AVAILABLE_IOS(8_0);
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0);

@end
