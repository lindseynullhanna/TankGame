//
//  Player.h
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tank.h"

@interface Player : NSObject
@property NSInteger playerNum;
@property NSInteger totalPoints;
@property(nonatomic, strong) Tank *tank;

-(Player*) initNewPlayer: (NSInteger) playerN;
@end
