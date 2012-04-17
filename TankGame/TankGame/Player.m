//
//  Player.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


@implementation Player

@synthesize playerNum;
@synthesize totalPoints;
@synthesize tank;

-(Player*) initNewPlayer: (NSInteger) playerN{
    self = [super init];
    
    if (self)    {
        [self setTotalPoints:0];
        self.tank = [[Tank alloc] initNewTank];
        self.playerNum = playerN;
    }
    
    return self;
}
@end
