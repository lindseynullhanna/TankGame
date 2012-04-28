//
//  TurretView.m
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
//

#import "TurretView.h"

@implementation TurretView
@synthesize currentAngle;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

@end
