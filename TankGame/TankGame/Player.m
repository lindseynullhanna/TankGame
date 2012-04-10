//
//  Player.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"


@implementation Player
@synthesize totalPoints;
//@synthesize tank;

-(Player*) initNewPlayer{
    self = [super init];
    
    if (self)    {
        [self setTotalPoints:0];
    }
    
    return self;
}
@end
