//
//  GameViewController.m
//  TankGame
//
//  Created by default on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "TankView.h"
#import "_94AppDelegate.h"

@implementation GameViewController{
    TankView *playerOne;
    TankView *playerTwo;
    TurretView *turretOne;
    TurretView *turretTwo;
    TargetView *target;
    
    BOOL isPvP;
    UILabel *playerOnePoints;
    UILabel *playerTwoPoints;
    
    
}

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

-(void) doLayout {
    
    //isPvP = ((_94AppDelegate*) [[UIApplication sharedApplication] delegate]).useAI;
    
    
    target = [[TargetView alloc] initWithFrame:CGRectMake(250., 10., 10., 50.)];
    
    playerOne = [[TankView alloc] initWithFrame:CGRectMake(100., 183., 50., 50.) playerNumber: 1];
    playerTwo = [[TankView alloc] initWithFrame:CGRectMake(20., 20., 50., 50.) playerNumber:2];
    
    turretOne = [[TurretView alloc] initWithFrame:CGRectMake(120., 203., 30., 10.)];
    turretTwo = [[TurretView alloc] initWithFrame:CGRectMake(40., 40., 30., 10.)];
    
    playerOnePoints = [[UILabel alloc] initWithFrame:CGRectMake(10., 390., 40., 20.)];
    playerTwoPoints = [[UILabel alloc] initWithFrame:CGRectMake(270., 390., 40., 20.)];
    
    playerOnePoints.text = [NSString stringWithFormat: @"%d", [playerOne getPoints]];
    playerTwoPoints.text = [NSString stringWithFormat: @"%d", [playerTwo getPoints]];
    playerTwoPoints.textAlignment = UITextAlignmentLeft;
    playerTwoPoints.textAlignment = UITextAlignmentRight;
    
    
    
    [self.view addSubview:target];
    
    [self.view addSubview:playerOne];
    [self.view addSubview:playerTwo];
    
    [self.view addSubview:turretOne];
    [self.view addSubview:turretTwo];  
    
    [self.view addSubview:playerOnePoints];
    [self.view addSubview:playerTwoPoints];    
}
- (void)viewDidLoad
{
    //NSLog(@"GVC view did load");
    [super viewDidLoad];
    
    [self doLayout];
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
