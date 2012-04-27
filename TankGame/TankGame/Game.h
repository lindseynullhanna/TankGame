//
//  Game.h
//  TankGame
//
//  Created by Lindsey Hanna on 4/10/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Game : NSObject{

}

@property NSInteger numPlayers;
@property (nonatomic, strong) NSMutableArray *players;



-(id)initTwoPlayerGame;

//-(NSMutableArray*) createPlayers;


@end
