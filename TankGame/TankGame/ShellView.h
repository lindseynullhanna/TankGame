//
//  ShellView.h
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TargetView.h"
#import "TankView.h"

@interface ShellView : UIView
@property CGFloat shellAngle;
@property (nonatomic, strong) TargetView *currentTarget;
@property(nonatomic,strong) TankView *myTank;

- (id)initWithFrame:(CGRect)frame angle: (CGFloat) currentAngle myTank: (TankView*) tank currentTarget: (TargetView*) target;
-(void) moveShell;
-(BOOL) noCollision;
@end
