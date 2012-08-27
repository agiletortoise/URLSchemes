//
//  AppDelegate.m
//  URLSchemes
//
//  Created by Greg Pierce on 7/27/12.
//  Copyright (c) 2012 Agile Tortoise, Inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    viewController = (ViewController *)self.window.rootViewController;

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    // Called when application is launch using a URL
    NSLog(@"openURL: %@", [url absoluteString]);
    NSLog(@"sourceApplication: %@", sourceApplication);
    
    // return YES if you handled the URL
    // return NO if you didn't know what to do with the URL.
    // returning NO does nothing. It is ignored, but it's the right thing to do.
    return [viewController handleIncomingURL:url];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
