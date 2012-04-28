//
//  _94ViewController.m
//  TankGame
//
//  Created by default on 4/9/12.
//  Copyright (c) 2012 Lindsey Hanna. All rights reserved.
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
    UILabel *currentPlayer;
    UILabel *currentTimeRemaining;
    
    UIButton *pvpButton;
    UIButton *pvcButton;
    IBOutlet UIBarButtonItem *backButton;
    
    NSTimer *shellTimer;
    NSTimer *playerTimer;
    NSTimer *playerDisplayTimer;
    
    NSInteger timeRemaining;
    NSInteger playerTime;
}
@synthesize backButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) setGameType {
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //create buttons for user to choose PvP or PvC
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
    //2-player PvP game
    isPvP = YES;
    [pvpButton removeFromSuperview];
    [pvcButton removeFromSuperview];
       
    [self doLayout]; 
    [self startTimers];
}

-(void) startTimers{
    //timer for switching players
     playerTimer = [NSTimer scheduledTimerWithTimeInterval:(playerTime + 1) target:self selector:@selector(switchPlayers) userInfo:nil repeats:YES];
    
    //timer for automatic firing of shells
    shellTimer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(shootShellsFromTurret:) userInfo:nil repeats:YES]; 
    
    //timer for display of time remaining
    playerDisplayTimer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];    
    
}

-(void) switchPlayers{
    //if it's player one's turn, switch to player two
    if (playerOne.myTurn == YES) {
        playerOne.myTurn = NO;
        playerTwo.myTurn = YES;
        currentPlayer.text = @"Player Two";
        [self.view bringSubviewToFront:target];
        currentTimeRemaining.center = CGPointMake(270., 30.);  
        currentTimeRemaining.textAlignment = UITextAlignmentRight;
        if (isPvP == NO)
            //playing against AI, it's now AI's turn
            [self playAITurn];        
    }
    //if it's player two's turn, switch to player one
    else if (playerTwo.myTurn == YES)            {
        playerOne.myTurn = YES;
        playerTwo.myTurn = NO;
        currentPlayer.text = @"Player One";     
        [self.view bringSubviewToFront:target];
        currentTimeRemaining.center = CGPointMake(50., 30.);
        currentTimeRemaining.textAlignment = UITextAlignmentLeft;
    }
    
    //reset countdown timer
    [playerDisplayTimer invalidate];    
    timeRemaining = playerTime;  
    currentTimeRemaining.text = [NSString stringWithFormat:@"%d", timeRemaining];
    playerDisplayTimer = [NSTimer scheduledTimerWithTimeInterval:1. target:self selector:@selector(updateCountdown) userInfo:nil repeats:YES];
}


-(void) updateCountdown{
    timeRemaining--;    
    if (timeRemaining > 5){
        currentTimeRemaining.textColor = [UIColor blackColor];
    }
    else{
        currentTimeRemaining.textColor = [UIColor redColor];
    }
    currentTimeRemaining.text = [NSString stringWithFormat:@"%d", timeRemaining];
}
-(IBAction) setPVC:(id)sender{
    //set up player v AI game
    isPvP = NO;
    [pvpButton removeFromSuperview];
    [pvcButton removeFromSuperview];
    
    [self doLayout];   
    [self startTimers];
}
- (IBAction)backtoMenu:(id)sender {
    //return to game type menu
    [self clearScreen];
    [shellTimer invalidate];
    [playerTimer invalidate];
    [playerDisplayTimer invalidate];
    [self setGameType];
}

-(void) clearScreen{
    //remove all subviews and "back" button
    NSArray *views = [self.view subviews];
    for (UIView *view in views){
        [view removeFromSuperview];
    }
    
    self.navigationItem.leftBarButtonItem = nil;
}
-(void) doLayout {
    
    //isPvP = ((_94AppDelegate*) [[UIApplication sharedApplication] delegate]).useAI;
    
    timeRemaining = playerTime; 
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //create target
    target = [[TargetView alloc] initWithFrame:CGRectMake(250., 10., 10., 50.)];
    
    //create player tanks
    playerOne = [[TankView alloc] initWithFrame:CGRectMake(50., 100., 50., 50.) playerNumber: 1];
    playerTwo = [[TankView alloc] initWithFrame:CGRectMake(50., 250., 50., 50.) playerNumber:2];
    
    //create player turrets
    turretOne = [[TurretView alloc] initWithFrame:CGRectMake(70., 120., 30., 10.)];
    turretTwo = [[TurretView alloc] initWithFrame:CGRectMake(70., 270., 30., 10.)];
    
    //create gameplay labels
    playerOnePoints = [[UILabel alloc] initWithFrame:CGRectMake(10., 390., 40., 20.)];
    playerTwoPoints = [[UILabel alloc] initWithFrame:CGRectMake(270., 390., 40., 20.)];
    currentPlayer   = [[UILabel alloc] initWithFrame:CGRectMake(0., 10., 320., 20.)];
    currentTimeRemaining = [[UILabel alloc] initWithFrame:CGRectMake(10., 10., 80., 40.)];
    
    //set label text & alignment
    playerOnePoints.text = [NSString stringWithFormat: @"%d", [playerOne getPoints]];
    playerTwoPoints.text = [NSString stringWithFormat: @"%d", [playerTwo getPoints]];
    currentPlayer.text = @"Player One";
    currentTimeRemaining.text = [NSString stringWithFormat:@"%d", timeRemaining];
    
    playerTwoPoints.textAlignment = UITextAlignmentLeft;
    playerTwoPoints.textAlignment = UITextAlignmentRight;
    currentPlayer.textAlignment = UITextAlignmentCenter;
    currentTimeRemaining.textAlignment = UITextAlignmentLeft;
    
    currentTimeRemaining.font = [UIFont systemFontOfSize:40.];    
    
    
    //add "back" button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Main Menu" style:UIBarButtonItemStylePlain target:self action:@selector(backtoMenu:)];
    
    
    //add views as subviews, and start target movement
    [self.view addSubview:currentPlayer];    
    [self.view addSubview:target];
    [target moveTargetDown];
    
    [self.view addSubview:playerOne];
    [self.view addSubview:playerTwo];
    
    [self.view addSubview:turretOne];
    [self.view addSubview:turretTwo];  
    
    [self.view addSubview:playerOnePoints];
    [self.view addSubview:playerTwoPoints]; 
    [self.view addSubview:currentTimeRemaining];
    
    [self updateScore];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
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
    //start with menu
    [self setGameType];
    playerTime = 10;
}   

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    [playerTimer invalidate];
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
    
    //fire shell according to turret angle
    
    if (playerOne.myTurn == YES){  
  
        ShellView *newShell = [[ShellView alloc] initWithFrame:CGRectMake(turretOne.frame.origin.x + turretOne.frame.size.width, turretOne.frame.origin.y, 10., 10.) angle:turretOne.currentAngle myTank:playerOne currentTarget:target];
        
        [newShell moveShell]; 
        
        [self.view addSubview:newShell];
    }else if (playerTwo.myTurn == YES/* && isPvP == YES*/){
        
        ShellView *newShell = [[ShellView alloc] initWithFrame:CGRectMake(turretTwo.frame.origin.x + turretTwo.frame.size.width, turretTwo.frame.origin.y, 10., 10.) angle:turretTwo.currentAngle myTank:playerTwo currentTarget:target];
        
        [newShell moveShell]; 
        
        [self.view addSubview:newShell];    
    }
}

-(void) updateScore {
    //update score labels
    playerOnePoints.text = [NSString stringWithFormat: @"%d", [playerOne getPoints]];
    playerTwoPoints.text = [NSString stringWithFormat: @"%d", [playerTwo getPoints]]; 
    
    [self performSelector:@selector(updateScore) withObject:nil afterDelay:.05];
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    //change angle of turret according to touch location
    UITouch *currentTouch = [touches anyObject];
    CGPoint currentPoint = [currentTouch locationInView:self.view];
    float x, y;
    
    if (playerOne.myTurn == YES){
        y = turretOne.frame.origin.y - currentPoint.y;
        x = turretOne.frame.origin.x - currentPoint.x;
            
        turretOne.transform = CGAffineTransformMakeRotation(atan2(y,x));
        turretOne.currentAngle = atan2(-y, -x);
    }
    else if (playerTwo.myTurn == YES && isPvP == YES){
        y = turretTwo.frame.origin.y - currentPoint.y;
        x = turretTwo.frame.origin.x - currentPoint.x;
        
        turretTwo.transform = CGAffineTransformMakeRotation(atan2(y,x));
        turretTwo.currentAngle = atan2(-y, -x);        
    }
}

-(void) playAITurn{
    
    //if using the AI, automate the turret angle movement
    //this is a pretty dumb AI but it gets the job done
    //could be improved to be smarter/dumber and have different difficulty options
    float x, y;
    
    x = turretTwo.center.x - target.center.x;
    y = turretTwo.center.y - target.center.y;
    
    turretTwo.transform = CGAffineTransformMakeRotation(atan2(y, x));
    turretTwo.currentAngle = atan2(-y,-x);
    
    [self performSelector:@selector(playAITurn) withObject:nil afterDelay:.1];
}

@end
