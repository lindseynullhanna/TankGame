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
    //NSLog(@"int 2player game");
    self = [super init];
    
    if(self){
        self.numPlayers = 2;
    //    self.players = [self createPlayers];
    }
    
    return self;
}

/*-(NSMutableArray*) createPlayers{
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:0];
    TankView *pl = nil;
    for(int i = 0; i<self->numPlayers; i++){
        pl = [[TankView alloc ]initNewPlayer:i];
        [temp addObject:pl];
    }
    
    return temp;
}
*/
@end
