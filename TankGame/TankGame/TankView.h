//
//  TankView.h
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TankView : UIView

@property(nonatomic, strong) UIColor *myColor;
@property NSInteger myPoints;
@property BOOL myTurn;
@property NSInteger playerNum;

-(id) initWithFrame:(CGRect)frame playerNumber: (NSInteger) player;
-(void) addPoints;
-(void) addBonusPoints;
-(NSInteger) getPoints;
@end
