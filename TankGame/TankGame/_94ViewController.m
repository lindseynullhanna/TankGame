//
//  _94ViewController.m
//  TankGame
//
//  Created by default on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "_94ViewController.h"
#import "TankView.h"
#import "TargetView.h"
#import "TurretView.h"
#import "ShellView.h"

@implementation _94ViewController{
    TankView *playerOne;
    TankView *playerTwo;
    TurretView *turretOne;
    TurretView *turretTwo;
    TargetView *target;
    
    BOOL isPvP;
    UILabel *playerOnePoints;
    UILabel *playerTwoPoints;
    
    UIButton *pvpButton;
    UIButton *pvcButton;
    
    NSTimer *timer;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) setGameType {
    
    self.view.backgroundColor = [UIColor grayColor];
    
    pvpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pvpButton setTitle:@"P v P" forState:UIControlStateNormal];
    [pvpButton addTarget:self action:@selector(setPVP:) forControlEvents:UIControlEventTouchUpInside];
    pvpButton.frame = CGRectMake(93., 120., 135., 58.);
    pvpButton.backgroundColor = [UIColor clearColor];
    
    pvcButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pvcButton setTitle:@"P v C" forState:UIControlStateNormal];
    [pvcButton addTarget:self action:@selector(setPVC:) forControlEvents:UIControlEventTouchUpInside];
    pvcButton.frame = CGRectMake(93., 232., 135., 58.);
    pvcButton.backgroundColor = [UIColor clearColor];    
    
    [self.view addSubview:pvpButton];
    [self.view addSubview:pvcButton];
    
}

-(IBAction) setPVP:(id)sender{
    
    NSLog(@"set PVP");
    isPvP = YES;
    [pvpButton removeFromSuperview];
    [pvcButton removeFromSuperview];
    
   // [pvcButton dealloc];
    
    [self doLayout];
    NSLog(@"rawr");
    timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(shootShellsFromTurret:) userInfo:nil repeats:YES];
    
}



-(IBAction) setPVC:(id)sender{
    isPvP = NO;
    
    [self.view delete:pvcButton];
    [self.view delete:pvpButton];
}
-(void) doLayout {
    
    //isPvP = ((_94AppDelegate*) [[UIApplication sharedApplication] delegate]).useAI;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    //NSLog(@"94 view did load");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self doLayout];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setGameType];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
    
-(IBAction) shootShellsFromTurret: (id)sender {
    if (playerOne.myTurn == YES){  
        ShellView *newShell = [[ShellView alloc] initWithFrame:CGRectMake(turretOne.frame.origin.x + turretOne.frame.size.width, turretOne.frame.origin.y, 10, 10)];   
        [newShell moveShellAtAngle:turretOne.currentAngle];  
        [self.view addSubview:newShell];
    }
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *currentTouch = [touches anyObject];
    CGPoint currentPoint = [currentTouch locationInView:self.view];
    float x, y;
    
    if (playerOne.myTurn == YES){
        y = turretOne.frame.origin.y - currentPoint.y;
        x = turretOne.frame.origin.x - currentPoint.x;
            
        turretOne.transform = CGAffineTransformMakeRotation(atan2(y,x));
        turretOne.currentAngle = atan2(y, x);
    }
    else if (playerTwo.myTurn == YES && isPvP == YES){
        y = turretTwo.frame.origin.y - currentPoint.y;
        x = turretTwo.frame.origin.x - currentPoint.x;
        
        turretTwo.transform = CGAffineTransformMakeRotation(atan2(y,x));    
    }
}
@end
