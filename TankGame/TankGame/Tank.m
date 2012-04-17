//
//  Tank.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tank.h"

//@synthesize myTurn;


@implementation Tank

@synthesize myTankView;
@synthesize myTurret;

-(id) initNewTank{
    self = [super init];
    
    if(self) {
        self.myTurret = [[Turret alloc] initNewTurret];
        
        
    }
    return self;
    
}

@end
