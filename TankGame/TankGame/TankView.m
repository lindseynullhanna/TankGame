//
//  TankView.m
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
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
        //init with zero points, and player one going first
        self.backgroundColor = [UIColor clearColor];
        self.myPoints = 0;
        self.playerNum = player;
        if (playerNum == 1){
            self.myTurn = YES;
            
        }
        else if (playerNum == 2) {
            self.myTurn = NO;
        }
        [self doLayout];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //draw rounded rectangular tank with a different color for each player
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10.];
    
    self.backgroundColor = [UIColor clearColor];
    
    if (self.playerNum == 1)
        [[UIColor blueColor] setFill];
    else if(self.playerNum == 2)
        [[UIColor purpleColor] setFill];
    [path fill];    
    
}

-(NSInteger) getPoints{
    return self.myPoints;
}

-(void) addPoints {
    self.myPoints += 10;
}

@end
