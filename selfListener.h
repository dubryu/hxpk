//
//  selfListener.h
//  firstLibpd
//
//  Created by 片山 隆介 on 2014/12/09.
//  Copyright (c) 2014年 片山隆介. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PdBase.h"
#import "PdDispatcher.h"

@interface selfListener : NSObject <PdListener> {
    UILabel *label;
}

-(id)initWithLabel:(UILabel *)label;
-(void)receiveFloat:(float)received fromSource:(NSString *)source;
+(float)getListnerVal;
+(float)getListnerVal2;
+(float)getListnerVal3;
+(float)getListnerVal4;
+(float)getListnerVal5;
+(float)getListnerVal6;

@end
