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
    
    //NSLog(@"%f", self.shellAngle );
    
    self.center = CGPointMake(self.center.x, self.center.y + 10);
    
    //self.transform = CGAffineTransformMakeTranslation(x, y);
    if(self.center.y + self.frame.size.height + 10. < self.superview.frame.size.height){ 
        [self performSelector:@selector(moveTargetDown) withObject:nil afterDelay:.1];
    }else{
        [self performSelector:@selector(moveTargetUp) withObject:nil afterDelay:.1];
    }
    
}

-(void) moveTargetUp{
    
    //NSLog(@"%f", self.shellAngle );
    
    self.center = CGPointMake(self.center.x, self.center.y - 10);
    
    //self.transform = CGAffineTransformMakeTranslation(x, y);
    if (self.frame.origin.y > 10.){
        [self performSelector:@selector(moveTargetUp) withObject:nil afterDelay:.1];
    }else {
        [self performSelector:@selector(moveTargetDown) withObject:nil afterDelay:.1];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
