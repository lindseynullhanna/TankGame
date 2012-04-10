//
//  Target.h
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target : NSObject{
    NSInteger speed;
    NSInteger startLocation;
    NSInteger hitPoints;
}

-(id) initTargetwithLocation: (NSInteger) l speed: (NSInteger) s hitPoints: (NSInteger) hp;

@end
