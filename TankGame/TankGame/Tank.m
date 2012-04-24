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

@synthesize myTurret;

-(id) initNewTank{
    self = [super init];
    
    if(self) {
        self.myTurret = [[Turret alloc] initNewTurret];
        //CGRect frame = CGRectMake(10., 10., 20, 20);
        //self.myTankView = [[TankView alloc] initWithFrame:frame];
        
    }
    return self;
    
}

@end
