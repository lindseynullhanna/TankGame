//
//  GameViewController.m
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "TankView.h"

@implementation GameViewController

@synthesize currentGame;
@synthesize currentGameView;
@synthesize players;
@synthesize currentPlayer;
@synthesize playerOneTankView;
@synthesize turretOneView;
@synthesize playerTwoTankView;
@synthesize turretTwoView;
@synthesize currentTargetView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"GVC view did load");
    [super viewDidLoad];
    currentGame = [[Game alloc] initTwoPlayerGame];
    
    [self.players addObject:currentGame.players];
    [self setCurrentPlayer: [self.players objectAtIndex:0]];
    
    CGRect frame = CGRectMake(0., 64., 320., 416.);
    [self setCurrentGameView:[[GameView alloc] initWithFrame:frame]];
    
    frame = CGRectMake(100., 183., 50., 50.);
    playerOneTankView = [[TankView alloc] initWithFrame: frame];
    playerOneTankView.backgroundColor = [UIColor blueColor];
    
    
    

    frame = CGRectMake(100., 183., 50., 50.);
    playerTwoTankView = [[TankView alloc] initWithFrame: frame];
    playerOneTankView.backgroundColor = [UIColor orangeColor];
    
    
    
    [currentGameView addSubview:playerOneTankView];
    [currentGameView addSubview:turretOneView];
    [currentGameView addSubview:playerTwoTankView];
    [currentGameView addSubview:turretTwoView];    
    [currentGameView addSubview:currentTargetView];
    
    
    [self.view addSubview:currentGameView];

    
    
    
}

- (void)viewDidUnload
{
    //NSLog(@"GVC view did UNload");
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



@end
