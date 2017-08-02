//
//  AppDelegate.m
//  STMovieProject
//
//  Created by 张红利 on 2017/7/28.
//  Copyright © 2017年 张红利. All rights reserved.
//

#import "AppDelegate.h"
#import "STCommonUtil.h"
#import "STMainViewController.h"
#import "MttExploreViewController.h"
#import "STMeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //init
    UIImage* tabImage = nil;
    UIImage* tabImageHithLight = nil;
    
    //Main Controller
    STMainViewController* mainController  = [[STMainViewController alloc]init];
    mainController.title = @"Main";
    tabImage = [[STCommonUtil imageWithColor:[UIColor redColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    tabImageHithLight = [[STCommonUtil imageWithColor:[UIColor grayColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    mainController.tabBarItem = [[UITabBarItem alloc]initWithTitle:mainController.title image:tabImage selectedImage:tabImageHithLight];
    UINavigationController* mainNavigationController = [[UINavigationController alloc]initWithRootViewController:mainController];
    
    //explore controller
    MttExploreViewController* exploreController  = [[MttExploreViewController alloc]init];
    exploreController.title = @"Explore";
     //改变单个tab的颜色,image的mode要选 UIImageRenderingModeAlwaysOriginal
    tabImage = [[STCommonUtil imageWithColor:[UIColor grayColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    tabImageHithLight = [[STCommonUtil imageWithColor:[UIColor greenColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    exploreController.tabBarItem = [[UITabBarItem alloc]initWithTitle:exploreController.title image:tabImage selectedImage:tabImageHithLight];
    UINavigationController* exploreNavigationController = [[UINavigationController alloc]initWithRootViewController:exploreController];

    //Me
    STMeViewController* meController  = [[STMeViewController alloc]init];
    meController.title = @"Me";
    tabImage = [[STCommonUtil imageWithColor:[UIColor redColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    tabImageHithLight = [[STCommonUtil imageWithColor:[UIColor redColor] withSize: CGSizeMake(30, 30)] imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    meController.tabBarItem = [[UITabBarItem alloc]initWithTitle:meController.title image:tabImage selectedImage:tabImageHithLight];
    UINavigationController* meNavigationController = [[UINavigationController alloc]initWithRootViewController: meController];

    //tab bar controller
    UITabBarController* mainTabBarController = [[UITabBarController alloc]init];
    mainTabBarController.viewControllers = @[mainNavigationController,exploreNavigationController,meNavigationController];
    //mainTabBarController.tabBar.tintColor = [UIColor purpleColor]; 设置整个tabbar的背景色
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = mainTabBarController;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
