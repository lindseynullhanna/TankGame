//
//  Target.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Target.h"

@implementation Target

@synthesize speed;
@synthesize startLocation;
@synthesize hitPoints;

-(id) initTargetwithLocation:(NSInteger)l speed:(NSInteger)s hitPoints:(NSInteger)hp{
    self = [super init];
    
    if(self) {
        self.startLocation = l;
        self.speed = s;
        self.hitPoints = hp;
        
    }
    return self;
}
@end
