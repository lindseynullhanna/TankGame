//
//  Turret.m
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Turret.h"

@implementation Turret
@synthesize angle;

-(id) initNewTurret{
    self = [super init];
    
    if(self) {
        self.angle = 0;
        
    }
    return self;
    
}
@end
