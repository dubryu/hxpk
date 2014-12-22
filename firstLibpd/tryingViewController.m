//
//  tryingViewController.m
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/10/20.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//

#import "tryingViewController.h"


@implementation tryingViewController
@synthesize buttonViewOneOn,buttonViewTwoOn,buttonViewThreeOn,buttonViewFourOn,buttonViewFiveOn,buttonViewSixOn,buttonViewOneStop,buttonViewTwoStop,buttonViewThreeStop,buttonViewFourStop,buttonViewFiveStop,buttonViewSixStop;
@synthesize imageDataOne, imageDataTwo, imageDataThree, imageDataFour, imageDataFive, imageDataSix;
@synthesize imgButtonRec,imgButtonStop;
@synthesize sl1,sl2,sl3,sl4,sl5,sl6;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //<2>------------------------------------------set of dispatcher,with PdBase to receive the several message
    dispatcher = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher];
    //<3>------------------------------------------then set the Listener to the dispatcher
    //routing is pd->pdbase->dispatcher->Listner
    //dispatcher = (PdDispatcher *)[PdBase delegate]; is unknown
    listener = [[selfListener alloc]init];
    listener2 = [[selfListener alloc]init];
    listener3 = [[selfListener alloc]init];
    listener4 = [[selfListener alloc]init];
    listener5 = [[selfListener alloc]init];
    listener6 = [[selfListener alloc]init];

    [dispatcher addListener:listener forSource:@"length1"];
    [dispatcher addListener:listener2 forSource:@"length2"];
    [dispatcher addListener:listener3 forSource:@"length3"];
    [dispatcher addListener:listener4 forSource:@"length4"];
    [dispatcher addListener:listener5 forSource:@"length5"];
    [dispatcher addListener:listener6 forSource:@"length6"];
    
    //[PdBase subscribe:@"length1"];はディスパッチャーとリスナーのセットを使うときはいらない？とおもう
    
    patch = [PdBase openFile:@"tableTest.pd"
                        path:[[NSBundle mainBundle] resourcePath]];
    
    if (!patch) {
        NSLog(@"Failed to open patch!"); // Gracefully handle failure...
    }
    
    imageDataOne = [UIImage imageNamed:@"backLight.png"];
    imageDataTwo = [UIImage imageNamed:@"backLight2.png"];
    imageDataThree = [UIImage imageNamed:@"backLight3.png"];
    imageDataFour = [UIImage imageNamed:@"backLight4.png"];
    imageDataFive = [UIImage imageNamed:@"backLight5.png"];
    imageDataSix = [UIImage imageNamed:@"backLight6.png"];
    
    //----------------------
    #pragma slider
    sl1 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20 , self.view.frame.size.height/7)];
    sl1.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7);
    sl1.maximumValue = 2999;
    sl1.minimumValue = 0;
    sl1.value = 2999;
    
    //ツマミの画像
    [sl1 setThumbImage: [UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    //最大値側の画像
    [sl1 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    //最小値側の画像
    [sl1 setMinimumTrackImage:[UIImage imageNamed:@"backLight.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl1];
    [self.view sendSubviewToBack:sl1];
    sl1.hidden = YES;
    //数値変化すると呼び出されるメソッド
    [sl1 addTarget:self action:@selector(hoge:)forControlEvents:UIControlEventValueChanged];
    
    sl2 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/7)];
    sl2.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7*2);
    sl2.maximumValue = 2999;
    sl2.minimumValue = 0;
    sl2.value = 2999;
    [sl2 setThumbImage:[UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    [sl2 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    [sl2 setMinimumTrackImage:[UIImage imageNamed:@"backLight2.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl2];
    [self.view sendSubviewToBack:sl2];
    sl2.hidden = YES;
    [sl2 addTarget:self action:@selector(hoge2:) forControlEvents:UIControlEventValueChanged];
    
    sl3 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/7)];
    sl3.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7*3);
    sl3.maximumValue = 2999;
    sl3.minimumValue = 0;
    sl3.value = 2999;
    [sl3 setThumbImage:[UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    [sl3 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    [sl3 setMinimumTrackImage:[UIImage imageNamed:@"backLight3.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl3];
    [self.view sendSubviewToBack:sl3];
    sl3.hidden = YES;
    [sl3 addTarget:self action:@selector(hoge3:) forControlEvents:UIControlEventValueChanged];
    
    sl4 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/7)];
    sl4.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7*4);
    sl4.maximumValue = 2999;
    sl4.minimumValue = 0;
    sl4.value = 2999;
    [sl4 setThumbImage:[UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    [sl4 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    [sl4 setMinimumTrackImage:[UIImage imageNamed:@"backLight4.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl4];
    [self.view sendSubviewToBack:sl4];
    sl4.hidden = YES;
    [sl4 addTarget:self action:@selector(hoge4:) forControlEvents:UIControlEventValueChanged];
    
    sl5 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/7)];
    sl5.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7*5);
    sl5.maximumValue = 2999;
    sl5.minimumValue = 0;
    sl5.value = 2999;
    [sl5 setThumbImage:[UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    [sl5 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    [sl5 setMinimumTrackImage:[UIImage imageNamed:@"backLight5.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl5];
    [self.view sendSubviewToBack:sl5];
    sl5.hidden = YES;
    [sl5 addTarget:self action:@selector(hoge5:) forControlEvents:UIControlEventValueChanged];
    
    sl6 = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, self.view.frame.size.height/7)];
    sl6.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/7*6);
    sl6.maximumValue = 2999;
    sl6.minimumValue = 0;
    sl6.value = 2999;
    [sl6 setThumbImage:[UIImage imageNamed:@"yellowThumb.png"] forState:UIControlStateNormal];
    [sl6 setMaximumTrackImage:[UIImage imageNamed:@"whiteSl.png"] forState:UIControlStateNormal];
    [sl6 setMinimumTrackImage:[UIImage imageNamed:@"backLight6.png"] forState:UIControlStateNormal];
    [self.view addSubview:sl6];
    [self.view sendSubviewToBack:sl6];
    sl6.hidden = YES;
    [sl6 addTarget:self action:@selector(hoge6:) forControlEvents:UIControlEventValueChanged];
    //----------------------
    


    #pragma buttons
    
    buttonViewOneOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewOneOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7);
    [self.view addSubview:buttonViewOneOn];
    
    buttonViewTwoOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewTwoOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7*2);
    [self.view addSubview:buttonViewTwoOn];
   
    buttonViewThreeOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewThreeOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7*3);
    [self.view addSubview:buttonViewThreeOn];
    
    buttonViewFourOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewFourOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7*4);
    [self.view addSubview:buttonViewFourOn];
    
    buttonViewFiveOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewFiveOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7*5);
    [self.view addSubview:buttonViewFiveOn];
    
    buttonViewSixOn = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewSixOn.center = CGPointMake(self.view.frame.size.width/3, self.view.frame.size.height/7*6);
    [self.view addSubview:buttonViewSixOn];
    
    buttonViewOneStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewOneStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7);
    [self.view addSubview:buttonViewOneStop];
    
    buttonViewTwoStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewTwoStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7*2);
    [self.view addSubview:buttonViewTwoStop];
    
    buttonViewThreeStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewThreeStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7*3);
    [self.view addSubview:buttonViewThreeStop];
    
    buttonViewFourStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewFourStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7*4);
    [self.view addSubview:buttonViewFourStop];
    
    buttonViewFiveStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewFiveStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7*5);
    [self.view addSubview:buttonViewFiveStop];
    
    buttonViewSixStop = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40*0.7, 40*0.7)];
    buttonViewSixStop.center = CGPointMake((self.view.frame.size.width/3)*2, self.view.frame.size.height/7*6);
    [self.view addSubview:buttonViewSixStop];
    
    //read the picture
    imgButtonRec = [UIImage imageNamed:@"recBt.png"];
    imgButtonStop = [UIImage imageNamed:@"stopBt.png"];
    
    //place the picture on the sheet
    buttonViewOneOn.image = imgButtonRec;
    buttonViewOneOn.tag = 1;
    buttonViewOneOn.userInteractionEnabled = YES;
    buttonViewOneStop.image = imgButtonStop;
    buttonViewOneStop.tag = 2;
    buttonViewOneStop.userInteractionEnabled = YES;
    
    buttonViewTwoOn.image = imgButtonRec;
    buttonViewTwoOn.tag = 3;
    buttonViewTwoOn.userInteractionEnabled = YES;
    buttonViewTwoStop.image = imgButtonStop;
    buttonViewTwoStop.tag = 4;
    buttonViewTwoStop.userInteractionEnabled = YES;

    buttonViewThreeOn.image = imgButtonRec;
    buttonViewThreeOn.tag = 5;
    buttonViewThreeOn.userInteractionEnabled = YES;
    buttonViewThreeStop.image = imgButtonStop;
    buttonViewThreeStop.tag = 6;
    buttonViewThreeStop.userInteractionEnabled = YES;
    
    buttonViewFourOn.image = imgButtonRec;
    buttonViewFourOn.tag = 7;
    buttonViewFourOn.userInteractionEnabled = YES;
    buttonViewFourStop.image = imgButtonStop;
    buttonViewFourStop.tag = 8;
    buttonViewFourStop.userInteractionEnabled =YES;
    
    buttonViewFiveOn.image = imgButtonRec;
    buttonViewFiveOn.tag = 9;
    buttonViewFiveOn.userInteractionEnabled = YES;
    buttonViewFiveStop.image = imgButtonStop;
    buttonViewFiveStop.tag = 10;
    buttonViewFiveStop.userInteractionEnabled = YES;
    
    buttonViewSixOn.image = imgButtonRec;
    buttonViewSixOn.tag = 11;
    buttonViewSixOn.userInteractionEnabled = YES;
    buttonViewSixStop.image = imgButtonStop;
    buttonViewSixStop.tag = 12;
    buttonViewSixStop.userInteractionEnabled = YES;
    
}

//スライダーの変化で呼ばれるメソッド
- (void)hoge:(UISlider*)slider{
    NSLog(@"slider change %f", sl1.value);
    [PdBase sendFloat:sl1.value toReceiver:@"SltoPd1"];
}
- (void)hoge2:(UISlider*)slider{
    NSLog(@"slider2 change %f", sl2.value);
    [PdBase sendFloat:sl2.value toReceiver:@"SltoPd2"];
}
- (void)hoge3:(UISlider*)slider{
    NSLog(@"slider3 change %f", sl3.value);
    [PdBase sendFloat:sl3.value toReceiver:@"SltoPd3"];
}
- (void)hoge4:(UISlider*)slider{
    NSLog(@"slider4 change %f", sl4.value);
    [PdBase sendFloat:sl4.value toReceiver:@"SltoPd4"];
}
- (void)hoge5:(UISlider*)slider{
    NSLog(@"slider5 change %f", sl5.value);
    [PdBase sendFloat:sl5.value toReceiver:@"SltoPd5"];
}
- (void)hoge6:(UISlider*)slider{
    NSLog(@"slider6 change %f", sl6.value);
    [PdBase sendFloat:sl6.value toReceiver:@"SltoPd6"];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent*)event
{
    // タッチされたときの処理
    //タッチされたビューを判定する
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            if (clickedOne == 0) {
                clickedOne = 1;
                [PdBase sendBangToReceiver:@"on"];
                //when you press this button if current state is 0,this view will be like recFin
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewOneOn.image = imgButtonOneRecFin;
            }else{
                clickedOne = 0;
                [PdBase sendBangToReceiver:@"off"];
                buttonViewOneOn.image = imgButtonRec;
            }
            break;
        case 2:
            [PdBase sendBangToReceiver:@"stop"];
            //reverse the color as none
            sl1.hidden = YES;
            break;
        case 3:
            if (clickedTwo == 0) {
                clickedTwo = 1;
                [PdBase sendBangToReceiver:@"on1"];
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewTwoOn.image = imgButtonOneRecFin;
            }else{
                clickedTwo = 0;
                [PdBase sendBangToReceiver:@"off1"];
                buttonViewTwoOn.image = imgButtonRec;
            }
            break;
        case 4:
            [PdBase sendBangToReceiver:@"stop1"];
            sl2.hidden = YES;
            break;
        case 5:
            if(clickedThree == 0){
                clickedThree = 1;
                [PdBase sendBangToReceiver:@"on2"];
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewThreeOn.image = imgButtonOneRecFin;
            }else{
                clickedThree = 0;
                [PdBase sendBangToReceiver:@"off2"];
                buttonViewThreeOn.image = imgButtonRec;
            }
            break;
        case 6:
            [PdBase sendBangToReceiver:@"stop2"];
            sl3.hidden = YES;
            break;
        case 7:
            if(clickedFour == 0){
                clickedFour = 1;
                [PdBase sendBangToReceiver:@"on3"];
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewFourOn.image = imgButtonOneRecFin;
            }else{
                clickedFour = 0;
                [PdBase sendBangToReceiver:@"off3"];
                buttonViewFourOn.image = imgButtonRec;
            }
            break;
        case 8:
            [PdBase sendBangToReceiver:@"stop3"];
            sl4.hidden = YES;
            break;
        case 9:
            if(clickedFive == 0){
                clickedFive = 1;
                [PdBase sendBangToReceiver:@"on4"];
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewFiveOn.image = imgButtonOneRecFin;
            }else{
                clickedFive = 0;
                [PdBase sendBangToReceiver:@"off4"];
                buttonViewFiveOn.image = imgButtonRec;
            }
            break;
        case 10:
            [PdBase sendBangToReceiver:@"stop4"];
            sl5.hidden = YES;
            break;
        case 11:
            if(clickedSix == 0){
                clickedSix = 1;
                [PdBase sendBangToReceiver:@"on5"];
                UIImage *imgButtonOneRecFin = [UIImage imageNamed:@"recFinBt.png"];
                buttonViewSixOn.image = imgButtonOneRecFin;
            }else{
                clickedSix = 0;
                [PdBase sendBangToReceiver:@"off5"];
                buttonViewSixOn.image = imgButtonRec;
            }
            break;
        case 12:
            [PdBase sendBangToReceiver:@"stop5"];
            sl6.hidden = YES;
            break;
            
        default:
            break;
    }
}

//録音停止ボタンが押された後離されるタイミングで、pdから返ってきたアレイの数値をスライダーに格納
//switch文はそれぞれbreak;を終わりに忘れないこと
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    switch (touch.view.tag) {
        case 1:
            if (clickedOne == 0) {
                sl1.value = [selfListener getListnerVal];
                sl1.hidden = NO;
                NSLog(@"sliderValue is%f", [selfListener getListnerVal]);
            }
            break;
        case 3:
            if (clickedTwo == 0) {
                sl2.value = [selfListener getListnerVal2];
                sl2.hidden = NO;
                NSLog(@"sliderValue2 is%f", [selfListener getListnerVal2]);
            }
            break;
        case 5:
            if (clickedThree == 0) {
                sl3.value = [selfListener getListnerVal3];
                sl3.hidden = NO;
                NSLog(@"sliderValue3 is%f", [selfListener getListnerVal3]);
            }
            break;
        case 7:
            if (clickedFour == 0) {
                sl4.value = [selfListener getListnerVal4];
                sl4.hidden = NO;
                NSLog(@"sliderValue4 is%f", [selfListener getListnerVal4]);
            }
            break;
        case 9:
            if (clickedFive == 0) {
                sl5.value = [selfListener getListnerVal5];
                sl5.hidden = NO;
                NSLog(@"sliderValue5 is%f", [selfListener getListnerVal5]);
            }
            break;
        case 11:
            if (clickedSix == 0) {
                sl6.value = [selfListener getListnerVal6];
                sl6.hidden = NO;
                NSLog(@"sliderValue6 is%f", [selfListener getListnerVal6]);
            }
            break;
        default:
            break;
    }
}
-(void)viewDidUnload
{
    [super viewDidUnload];
    [PdBase closeFile:patch];
    [PdBase setDelegate:nil];
    //Even with ARC, there are some resources that will not be automatically released, such as Pd patches and the delegate of PdBase.
}
// Omitting the remaining view controller methods... @end

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(void)dealloc{
    [dispatcher release];
    [PdBase setDelegate:nil];
    [super dealloc];
}
*/
@end