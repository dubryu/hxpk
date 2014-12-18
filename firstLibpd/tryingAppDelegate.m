//
//  tryingAppDelegate.m
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/10/20.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//

#import "tryingAppDelegate.h"
#import "tryingViewController.h"

@implementation tryingAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize audioController = _audioController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //[PdBase setDelegate:self];
    //[PdBase subscribe:@"length1"];
    
    //audio controller class implements the AVAudioSession Delegate protocol
    //An instance of PdAudiocontroller will register itself as the audio session delegate, and it will
    //automatically suspend playback when a phone call comes in.
    _audioController = [[PdAudioController alloc] init];
    if ([self.audioController configurePlaybackWithSampleRate:44100
                                               numberChannels:2 inputEnabled:YES mixingEnabled:NO] != PdAudioOK)
        {
            NSLog(@"failed to initialize audio components");
        }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.viewController = [[tryingViewController alloc]
    //                     initWithNibName:@"tryingViewController" bundle:nil];
    UIStoryboard* storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* tViewController = [storyBoard instantiateInitialViewController];
    self.window.rootViewController = tViewController;
    [self.window makeKeyAndVisible];
    
    
    //this is needed to identify the float message from pd by per listener
    
    
    return YES;
   
}
/*
- (void)receiveFloat:(float)received fromSource:(NSString *)source{
    
    
}
*/
- (void)applicationWillResignActive:(UIApplication *)application
{
    self.audioController.active = NO; //
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
    self.audioController.active = YES; //
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)dealloc{
    [self.window release];
    [self.viewController release];
    [self.audioController release];
    [super dealloc];
}

@end
