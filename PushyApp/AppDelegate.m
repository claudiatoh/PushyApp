//
//  AppDelegate.m
//  PushyApp
//
//  Created by Claudia Toh Yi An on 10/7/16.
//  Copyright © 2016 Claudia Toh. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//Predefined callback for foreground inactive state.
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UILocalNotification *localNotification = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
    if(localNotification){
        //create an alert.
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received from notification launch." message:localNotification.alertBody preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *aa= [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:nil];
        [ac addAction:aa];
        dispatch_async(dispatch_get_main_queue(), ^{
            [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
        });
        
    }

    return YES;
}

//Predefined callback for active state runtime
- (void)application:(UIApplication *)application didReceiveLocalNotification:(nonnull UILocalNotification *)notification{
    //create an alert.
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Received when running." message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *aa= [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:nil];
    [ac addAction:aa];
    dispatch_async(dispatch_get_main_queue(), ^{
        [application.keyWindow.rootViewController presentViewController:ac animated:YES completion:nil];
    });
                   
    
    
}

@end
