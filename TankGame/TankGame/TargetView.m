//
//  TargetView.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TargetView.h"

@implementation TargetView

-(void) doLayout{
    self.backgroundColor = [UIColor orangeColor];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doLayout];
    }
    return self;
}

-(void) moveTargetDown{
    
    //move the target down
    self.center = CGPointMake(self.center.x, self.center.y + 10);
    
    //if the target hasn't reached the bottom, keep moving down
    if(self.center.y + self.frame.size.height + 10. < self.superview.frame.size.height){ 
        [self performSelector:@selector(moveTargetDown) withObject:nil afterDelay:.1];
    }
    //otherwise, start moving up
    else{
        [self performSelector:@selector(moveTargetUp) withObject:nil afterDelay:.1];
    }
    
}

-(void) moveTargetUp{
    
    //move target up    
    self.center = CGPointMake(self.center.x, self.center.y - 10);
    
    //if the target hasn't reached the top, keep moving up
    if (self.frame.origin.y > 10.){
        [self performSelector:@selector(moveTargetUp) withObject:nil afterDelay:.1];
    }
    //otherwise, start moving down
    else {
        [self performSelector:@selector(moveTargetDown) withObject:nil afterDelay:.1];
    }
}

@end
