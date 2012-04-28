//
//  ShellView.m
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
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
                                        
    
    CGFloat x = cos(self.shellAngle) * 10;
    CGFloat y = sin(self.shellAngle) * 10;
    
    //NSLog(@"%f", self.shellAngle );
    
    self.center = CGPointMake(self.center.x + x, self.center.y + y);

    //self.transform = CGAffineTransformMakeTranslation(x, y);
    if ([self noCollision]){
        [self performSelector:@selector(moveShell) withObject:nil afterDelay:.1];
    }
      
}

-(BOOL) noCollision{
    
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
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.backgroundColor = [UIColor clearColor];
    if (self.myTank.playerNum == 1)
        [[UIColor blueColor] setFill];
    else if (self.myTank.playerNum == 2)
        [[UIColor purpleColor] setFill];
    [path fill];
}


@end
