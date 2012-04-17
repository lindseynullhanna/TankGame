//
//  Tank.h
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TankView.h"
#import "Turret.h"

@interface Tank : NSObject
@property(nonatomic, weak) TankView *myTankView;
@property(nonatomic, strong) Turret *myTurret;

-(id) initNewTank;

@end 
