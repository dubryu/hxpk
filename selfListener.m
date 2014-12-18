//
//  selfListener.m
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/12/09.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//

#import "selfListener.h"

@implementation selfListener

static float classValue; //オブジェクトに静的な記憶クラスを与える。関数の中でも外でも使用可にするもの。
                        //objective-Cでは実装ファイルの中でstatic指定子とともに定義された変数を、そのクラスのクラス変数の代用として利用します。
                         //インスタンス変数では対応できない変数を他クラスでも使うときはこれを使用し、さらに他クラスでも使うときはこれを内包するクラスメソッドを定義する。
static float classValue2,classValue4,classValue5,classValue6;
static float classValue3;

- (id)initWithLabel:(UILabel *)s {
    self = [super init];
    if (self) {
        label = s;
        [label retain];
        NSLog(@"loading is success");
    }else{
        NSLog(@"loading the selfListener is failed");
    }
    return self;
}


- (void)receiveBangFromSource:(NSString *)source {
    NSLog(@"Listener %@: bang\n", label);
}

- (void)receiveFloat:(float)received fromSource:(NSString *)source{
    if ([source isEqualToString:@"length1"]) {
        //static変数をつかったアプローチ
        classValue = received;
    }
    if ([source isEqualToString:@"length2"]) {
        //static変数をつかったアプローチ
         classValue2 = received;
    }
    if ([source isEqualToString:@"length3"]) {
        //static変数をつかったアプローチ
        classValue3 = received;
    }
    if ([source isEqualToString:@"length4"]) {
        //static変数をつかったアプローチ
        classValue4 = received;
    }
    if ([source isEqualToString:@"length5"]) {
        //static変数をつかったアプローチ
        classValue5 = received;
    }
    if ([source isEqualToString:@"length6"]) {
        //static変数をつかったアプローチ
        classValue6 = received;
    }
}
//pdから値を受け取るメソッドとは別に、pdからの値を格納した変数を呼び出す機能だけを持ったメソッドが要るはず
//関数とメソッドの違いは処理に必要なデータを引数として渡す必要があるか、自身のデータを利用するかの違い
+ (float)getListnerVal{
    
    return classValue;
}
+ (float)getListnerVal2{

    return classValue2;
}
+ (float)getListnerVal3{
    
    return classValue3;
}
+ (float)getListnerVal4{
    
    return classValue4;
}
+ (float)getListnerVal5{
    
    return classValue5;
}
+ (float)getListnerVal6{
    
    return classValue6;
}

@end
