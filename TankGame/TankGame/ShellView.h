//
//  ShellView.h
//  TankGame
//
//  Created by default on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ShellView : UIView
@property CGFloat shellAngle;

- (id)initWithFrame:(CGRect)frame angle: (CGFloat) currentAngle;
-(void) moveShell;
@end
