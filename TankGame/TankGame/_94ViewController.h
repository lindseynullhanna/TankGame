//
//  _94ViewController.h
//  TankGame
//
//  Created by default on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TurretView.h"


@interface _94ViewController : UIViewController


-(void) doLayout;
-(void) setGameType;
-(void) setPVP:(id)sender;
-(void) setPVC:(id)sender;
-(void) shootShellsFromTurret: (TurretView*) theTurret;
-(void) updateScore;
-(void) updateCountdown;
-(void) switchPlayers;
-(void) playAITurn;


@end
