//
//  tryingAppDelegate.h
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/10/20.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//
//<1>audioController
//<2>dispatcher
//<3>Connecting the User Interface
//<4>

#import <UIKit/UIKit.h>
#import "PdAudioController.h"
#import "PdBase.h"

@class tryingViewController;

@interface tryingAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) tryingViewController *viewController;
@property (strong, nonatomic, readonly) PdAudioController *audioController;

@end
