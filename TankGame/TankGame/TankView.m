//
//  TankView.m
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TankView.h"

@implementation TankView

@synthesize myTurn, myColor, myPoints, playerNum;

-(void) doLayout
{
    
}

- (id)initWithFrame:(CGRect)frame playerNumber: (NSInteger) player
{
    self = [super initWithFrame:frame];
    if (self) {
        self.myPoints = 0;
        self.playerNum = player;
        if (playerNum == 1){
            self.backgroundColor = [UIColor blueColor];
            self.myTurn = YES;
            
        }
        else if (playerNum == 2) {
            self.backgroundColor = [UIColor purpleColor];
            self.myTurn = NO;
        }
        [self doLayout];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(NSInteger) getPoints{
    return self.myPoints;
}

-(void) addPoints {
    self.myPoints += 10;
}

-(void) addBonusPoints {
    self.myPoints += 15;
}
@end
