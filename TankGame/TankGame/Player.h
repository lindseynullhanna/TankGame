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
@property NSInteger totalPoints;
//@property Tank tank;

-(Player*) initNewPlayer;
@end
