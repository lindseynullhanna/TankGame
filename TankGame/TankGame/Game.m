//
//  Game.m
//  TankGame
//
//  Created by default on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"


@implementation Game
@synthesize numPlayers;
@synthesize players;

-(id)initTwoPlayerGame{
    self = [super init];
    
    if(self){
        //self->level = 1;
        self->numPlayers = 2;
        self.players = [self createPlayers];
    }
    
    return self;
}

-(NSMutableArray*) createPlayers{
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    Player *pl = nil;
    for(int i = 0; i<self->numPlayers; i++){
        pl = [[Player alloc ]initNewPlayer:i];
        [temp addObject:pl];
    }
    
    return temp;
}

@end
