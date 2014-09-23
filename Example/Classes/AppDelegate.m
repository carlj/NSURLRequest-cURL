//
//  AppDelegate.m
//  NSURLReqeust-cURL
//
//  Created by Carl Jahn on 17.09.14.
//  Copyright (c) 2014 Carl Jahn. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [ViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
