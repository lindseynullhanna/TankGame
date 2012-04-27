//
//  ShellView.m
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShellView.h"

@implementation ShellView
//@synthesize myShell;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        //[self performSelector:@selector(moveShell:theta:) withObject:self afterDelay:.1];   
    }
    return self;
}

-(void) moveShellAtAngle: (float) angle{
                                        
    
    float x = cos(angle) * 10;
    float y = sin(angle) * 10;
    
    NSLog(@"%f", y );
    
    self.center = CGPointMake(self.center.x + x, self.center.y + y);
    //self.transform = CGAffineTransformMakeTranslation(x, y);
    
    [self performSelector:@selector(moveShellAtAngle:) withObject:self afterDelay:.1];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.backgroundColor = [UIColor clearColor];
    [[UIColor redColor] setFill];
    
    [path fill];
}


@end
