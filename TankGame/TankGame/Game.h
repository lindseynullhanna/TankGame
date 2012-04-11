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
    //NSInteger level;
    NSInteger numPlayers;
    NSMutableArray* players;
    Player *currentPlayer;
    Player *nextPlayer;
    Target *target;
}

-(id)initSinglePlayerGame;
-(id)initTwoPlayerGame;

-(NSMutableArray*) createPlayers;


@end
