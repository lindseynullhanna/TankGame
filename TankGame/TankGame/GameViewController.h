//
//  GameViewController.h
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Target.h"
#import "Game.h"

@interface GameViewController : UIViewController
@property(nonatomic, strong) Game *currentGame;
@property(nonatomic, strong) NSMutableArray *players;
@property(nonatomic, strong) Target *currentTarget;


@end
