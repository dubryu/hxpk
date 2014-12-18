//
//  tryingViewController.h
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/10/20.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdDispatcher.h" //<2>
#import <AVFoundation/AVFoundation.h>
#import "tryingAppDelegate.h"
#import "selfListener.h"


@interface tryingViewController : UIViewController
{
    PdDispatcher *dispatcher; //<2>
    void *patch;
    UILabel *fooLabel;
    
    //下の書き方だけではリスナーにはならない。必要なメソッドを記述したリスナークラスを自作してメインスレッドの中で、
    //addListenerメソッドの中でそのリスナーを指定してから
    //fromSourceでpdの送信元のオブジェクトの名前でソースを指定して使用する
    //PdDispatcher *myListener;

    selfListener *listener;
    selfListener *listener2;
    selfListener *listener3;
    selfListener *listener4;
    selfListener *listener5;
    selfListener *listener6;
    
    int clickedOne, clickedTwo, clickedThree, clickedFour, clickedFive, clickedSix;
    
    //although I dont know why, but it needs to be style of array
    NSMutableArray *layoutConstraints1;
    NSMutableArray *layoutConstraints2;
    NSMutableArray *layoutConstraints3;
    NSMutableArray *layoutConstraints4;
    NSMutableArray *layoutConstraints5;
    NSMutableArray *layoutConstraints6;
    
    
}

//<3>-----------------------

//It was needed to change per instance into setter/getter property
#pragma about background
@property (strong, nonatomic) UIImage *imageDataOne;
@property (strong, nonatomic) UIImage *imageDataTwo;
@property (strong, nonatomic) UIImage *imageDataThree;
@property (strong, nonatomic) UIImage *imageDataFour;
@property (strong, nonatomic) UIImage *imageDataFive;
@property (strong, nonatomic) UIImage *imageDataSix;

#pragma about Button
@property (strong, nonatomic) UIImage *imgButtonRec;
@property (strong, nonatomic) UIImage *imgButtonStop;
@property (strong, nonatomic) UIImageView *buttonViewOneOn;
@property (strong, nonatomic) UIImageView *buttonViewTwoOn;
@property (strong, nonatomic) UIImageView *buttonViewThreeOn;
@property (strong, nonatomic) UIImageView *buttonViewFourOn;
@property (strong, nonatomic) UIImageView *buttonViewFiveOn;
@property (strong, nonatomic) UIImageView *buttonViewSixOn;
@property (strong, nonatomic) UIImageView *buttonViewOneStop;
@property (strong, nonatomic) UIImageView *buttonViewTwoStop;
@property (strong, nonatomic) UIImageView *buttonViewThreeStop;
@property (strong, nonatomic) UIImageView *buttonViewFourStop;
@property (strong, nonatomic) UIImageView *buttonViewFiveStop;
@property (strong, nonatomic) UIImageView *buttonViewSixStop;
/*@property (strong, nonatomic) AVAudioSession *output;*/
@property (strong, nonatomic) UISlider *sl1;
@property (strong, nonatomic) UISlider *sl2;
@property (strong, nonatomic) UISlider *sl3;
@property (strong, nonatomic) UISlider *sl4;
@property (strong, nonatomic) UISlider *sl5;
@property (strong, nonatomic) UISlider *sl6;

@end
