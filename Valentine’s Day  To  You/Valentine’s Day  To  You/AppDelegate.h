//
//  AppDelegate.h
//  Valentine’s Day  To  You
//
//  Created by yons on 14-2-12.
//  Copyright (c) 2014年 yons. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,AVAudioPlayerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong)AVAudioPlayer *player;

@end
