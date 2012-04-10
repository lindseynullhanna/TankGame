//
//  Game.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"


@implementation Game


-(id)initSinglePlayerGame{
    self = [super init];
    
    if(self){
        //self->level = 1;
        self->numPlayers = 1;
        self->players = [self createPlayers];
        self->currentPlayer = [players objectAtIndex:0];
        self->nextPlayer = nil;
        self->target = [[Target alloc] initTargetwithLocation:100 speed:100 hitPoints:10];
  
    }
       
    return self;
}

-(id)initTwoPlayerGame{
    self = [super init];
    
    if(self){
        //self->level = 1;
        self->numPlayers = 2;
        self->players = [self createPlayers];
        self->currentPlayer = [players objectAtIndex:0];
        self->nextPlayer = [players objectAtIndex:1];
    }
    
    return self;
}

-(NSMutableArray*) createPlayers{
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    Player *pl = nil;
    for(int i = 0; i<self->numPlayers; i++){
        pl = [[Player alloc ]initNewPlayer];
        [temp addObject:pl];
    }
    
    return temp;
}
@end
