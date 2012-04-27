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


- (id)initWithFrame:(CGRect)frame angle: (CGFloat) currentAngle
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.shellAngle = currentAngle;
    }
    return self;
}

-(void) moveShell{
                                        
    
    CGFloat x = cos(self.shellAngle) * 10;
    CGFloat y = sin(self.shellAngle) * 10;
    
    //NSLog(@"%f", self.shellAngle );
    
    self.center = CGPointMake(self.center.x + x, self.center.y + y);

    //self.transform = CGAffineTransformMakeTranslation(x, y);

    [self performSelector:@selector(moveShell:) withObject:nil afterDelay:.1];
    
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
