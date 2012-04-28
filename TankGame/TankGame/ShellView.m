//
//  ShellView.m
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
//

#import "ShellView.h"

@implementation ShellView
@synthesize shellAngle;
@synthesize currentTarget;
@synthesize myTank;

- (id)initWithFrame:(CGRect)frame angle: (CGFloat) currentAngle myTank: (TankView*) tank currentTarget: (TargetView*) target{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.shellAngle = currentAngle;
        self.myTank = tank;
        self.currentTarget = target;    
    }
    return self;
}

-(void) moveShell{
                                        
    //move shell according to turret angle
    CGFloat x = cos(self.shellAngle) * 10;
    CGFloat y = sin(self.shellAngle) * 10;
    
    self.center = CGPointMake(self.center.x + x, self.center.y + y);
    
    //if it hasn't collided with something, keep moving)
    if ([self noCollision]){
        [self performSelector:@selector(moveShell) withObject:nil afterDelay:.1];
    }
      
}

-(BOOL) noCollision{
    
    //check for a collision with the target or moving offscreen
    
    if (self.center.y + self.frame.size.width/2 > 320) {
        //offscreen
        [self removeFromSuperview];
        return FALSE;
    }
    else if(self.center.x + self.frame.size.width/2 >= currentTarget.frame.origin.x && 
            self.center.y + self.frame.size.width/2 >= currentTarget.frame.origin.y && 
            self.center.y + self.frame.size.width/2 <= currentTarget.frame.origin.y + currentTarget.frame.size.height){
        //hit target
        [self removeFromSuperview];
        [self.myTank addPoints];
        return FALSE;
    }
    else 
        return TRUE;
    
}

- (void)drawRect:(CGRect)rect
{
    //draw circular shell with same color as player tank
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.backgroundColor = [UIColor clearColor];
    if (self.myTank.playerNum == 1)
        [[UIColor blueColor] setFill];
    else if (self.myTank.playerNum == 2)
        [[UIColor purpleColor] setFill];
    [path fill];
}


@end
