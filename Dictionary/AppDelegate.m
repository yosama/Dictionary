//
//  AppDelegate.m
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "AppDelegate.h"
#import "YOSWordsModel.h"
#import "YOSWordsTableViewController.h"
#import "YOSDefinitionViewController.h"
#import "UIViewController+Navigation.h"



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    YOSWordsModel *model = [[YOSWordsModel alloc]init];
    YOSWordsTableViewController *wordsTVC = [[YOSWordsTableViewController alloc] initWithModel:model
                                                                                         style:UITableViewStylePlain];
    
    YOSDefinitionViewController *definitionVC = [[YOSDefinitionViewController alloc] initWithModel:[model wordAtIndex:0 inLetterAtIndex:0]];
    wordsTVC.delegate = definitionVC;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        [self configureForIpadByLeftView:wordsTVC rigthView:definitionVC];
    } else {
        [self configureForIPhoneByLeftView:wordsTVC rigthView:definitionVC];
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Configuration

-(void) configureForIpadByLeftView:(YOSWordsTableViewController *) wordsTVC rigthView:(YOSDefinitionViewController *) definitionVC {

    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[[wordsTVC wrapperNavigation], [definitionVC wrapperNavigation]]];

    splitVC.delegate = definitionVC;
    self.window.rootViewController = splitVC;
}

-(void) configureForIPhoneByLeftView:(YOSWordsTableViewController *) wordsTVC rigthView:(YOSDefinitionViewController *) definitionVC {
    self.window.rootViewController =  [wordsTVC wrapperNavigation];
}


@end
