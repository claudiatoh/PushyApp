//
//  ViewController.m
//  PushyApp
//
//  Created by Claudia Toh Yi An on 10/7/16.
//  Copyright © 2016 Claudia Toh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (void) requestPermission;
- (void) createNotification: (int) notificationDuration;
@end

@implementation ViewController

//Implementation of app initiated notification.
- (void) requestPermission{
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge;
    UIUserNotificationSettings *settings= [UIUserNotificationSettings settingsForTypes:(types) categories:nil];
    [[UIApplication sharedApplication]registerUserNotificationSettings:settings];
}

- (void) createNotification:(int)notificationDuration{
    UILocalNotification *localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:notificationDuration];
    localNotification.timeZone = nil; //time zone follows user unless specified.
    localNotification.alertTitle = @"Alert title.";
    localNotification.alertBody = @"Alert body.";
    localNotification.alertAction = @"Alert action.";
    localNotification.soundName = UILocalNotificationDefaultSoundName; //using default sound alert.
    localNotification.applicationIconBadgeNumber = 2929;
    [[UIApplication sharedApplication] scheduleLocalNotification: localNotification];
}
- (IBAction)notifyUser:(id)sender {
    [self requestPermission];
    [self createNotification:15];//seconds after button is tapped
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
