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



@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ) {
        
        [self configureForIpad];
    } else {
        
        [self configureForIPhone];
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


-(void) configureForIpad {
    
    // Create model
    YOSWordsModel *model = [[YOSWordsModel alloc]init];
    
    // Create controllers
    YOSWordsTableViewController *wordsTVC = [[YOSWordsTableViewController alloc] initWithModel:model
                                                                                        style:UITableViewStylePlain];
    
    YOSDefinitionViewController *definitionVC = [[YOSDefinitionViewController alloc] initWithModel:[model wordAtIndex:0 inLetterAtIndex:0]];
    
    // Create combinators
    //NavigationController of wordNav
    UINavigationController *wordNav = [[UINavigationController alloc] init];
    [wordNav pushViewController:wordsTVC animated:NO];
    
    // NavigationController of definitionVC
    UINavigationController *definitionNav = [[UINavigationController alloc] init];
    [definitionNav pushViewController:definitionVC
                       animated:NO];
    
    // Create SplitViewController
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[wordNav, definitionNav]];
    
    // Assign Delegate
    splitVC.delegate = definitionVC;
    wordsTVC.delegate = definitionVC;
    
    // Assign splitVC to rootViewController
    self.window.rootViewController = splitVC;

}



-(void) configureForIPhone {
    
    // Create model
    YOSWordsModel *model = [[YOSWordsModel alloc]init];
    
    // Create controllers
    YOSWordsTableViewController *wordsTVC = [[YOSWordsTableViewController alloc] initWithModel:model
                                                                                         style:UITableViewStylePlain];
    
    YOSDefinitionViewController *definitionVC = [[YOSDefinitionViewController alloc] initWithModel:[model wordAtIndex:0 inLetterAtIndex:0]];
    
    // Create combinators
    //NavigationController of wordNav
    UINavigationController *wordNav = [[UINavigationController alloc]init];
    [wordNav pushViewController:definitionVC animated:NO];
    
    // Assign Delegate
    
    wordsTVC.delegate = definitionVC;
    
    self.window.rootViewController = wordsTVC;
}


@end
