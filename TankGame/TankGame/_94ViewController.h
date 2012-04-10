//
//  _94ViewController.h
//  TankGame
//
//  Created by default on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface _94ViewController : UIViewController
- (IBAction)Single:(id)sender;
- (IBAction)Double:(id)sender;
@property(weak, nonatomic) IBOutlet Game *game;


@end
