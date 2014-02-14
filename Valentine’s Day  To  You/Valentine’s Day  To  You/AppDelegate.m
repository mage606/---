//
//  AppDelegate.m
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-12.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate
@synthesize player;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    NSString *path = [NSString stringWithFormat:@"%@/123.mp3",[[NSBundle mainBundle] resourcePath]];
   
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"Beat It" ofType:@"mp3"];
//    //    NSURL *url = [NSURL URLWithString:path];//不能这样写，因为是本地路径
//    NSURL *url = [NSURL fileURLWithPath:path];//本地路径应该这样写
//    
//    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//    //触发play事件的时候会将mp3文件加载到内存中，然后再播放，所以开始的时候可能按按钮的时候会卡，所以需要prepare
//    [_player prepareToPlay];
//    //设置支持变速
//    _player.enableRate = YES;
//    //峰值和平均值
//    _player.meteringEnabled = YES;
    
    MainViewController *mvc=[[MainViewController alloc]init];
    self.window.rootViewController=mvc;
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker error:nil];
    [audioSession setActive:YES error:nil];
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"123" ofType:@"mp3"];
    NSLog(@"path = %@",path);
    NSURL *url=[NSURL fileURLWithPath:path];
    NSLog(@"%@",url);
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    player.delegate=self;
    [player prepareToPlay];
    [player setVolume:1];
    [player play];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
