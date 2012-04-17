//
//  Game.h
//  TankGame
//
//  Created by Lindsey Hanna on 4/10/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Target.h"

@interface Game : NSObject{

}

@property NSInteger numPlayers;
@property NSMutableArray *players;
@property Player *currentPlayer;
@property Player *nextPlayer;
@property Target *target;



-(id)initTwoPlayerGame;

-(NSMutableArray*) createPlayers;


@end
