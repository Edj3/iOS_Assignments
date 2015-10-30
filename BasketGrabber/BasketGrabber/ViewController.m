//
//  ViewController.m
//  BasketGrabber
//
//  Created by Unbounded on 4/8/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGPoint lastTouchSpot;
    NSTimer *spawnTimer;
    NSTimer *moveTimer;
    NSTimer *frameTimer;
    NSMutableArray *rockCollection;
    NSUInteger *xCount;
    UIImageView *newRockView;
    int movement;
    int score;
    int rockCount;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialize counter variables to 0
    rockCount =0;
    movement = 0;
    score = 0;
    xCount = 30*(arc4random()%10);
    //create labels to display the score
    _scoreTitle = [[UILabel alloc]initWithFrame:CGRectMake(180, 40, 50, 20)];
    [_scoreTitle setText:@"Score:"];
    [self.view addSubview:_scoreTitle];
    _scoreDisplay = [[UILabel alloc]initWithFrame:CGRectMake(240, 40, 70, 20)];
    [_scoreDisplay setText:[NSString stringWithFormat:@"%d",score]];
    [self.view addSubview:_scoreDisplay];
    
    //initialize images to be used
    UIImage *rock = [UIImage imageNamed:@"Rock.png"];
    UIImage *basket = [UIImage imageNamed:@"Basket.jpg"];
    
    //initialize two timers. One for the spawning of the rocks and one for the frequency of movement of the rocks.
    spawnTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(rockSpawn) userInfo:nil repeats:YES];
    moveTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(rockMove) userInfo:nil repeats:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //initialize subviews to be used througout the project
    _rockView = [[UIImageView alloc]initWithImage:rock];
	_basketView = [[UIImageView alloc]initWithImage:basket];
    newRockView = [[UIImageView alloc]initWithImage:rock];
    
    //FUNCTION CALLS :D
    //spawn your rocks
    [self rockSpawn];
    
    [self basketSpawn];
    //[self.rockView setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.view addSubview:_basketView];
    //[self.view addSubview:_basketView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rockSpawn
{
    //the math: to space the rocks out, you want to spread them out by 30
    //since the 30 has to stay static, you need to get a random number to multiply by 30
    //this means that your product of random number * 30 cannot go over 300
    //use arc4random to produce a random number every time the program is run
    //int ran = xCount;
    int ran = 30*(arc4random()%10);
    rockCount = rockCount+1;
    
    [self.view addSubview:_rockView];
    
    //[rockCollection addObject:_rockView];
    //[self.view addSubview:[rockCollection objectAtIndex:rockCount]];
    //[[rockCollection objectAtIndex:rockCount] setFrame:CGRectMake((30*ran), 0, 40, 40)];
    [_rockView setFrame:CGRectMake(ran, 0, 40, 40)];
    //NSLog([NSString stringWithFormat:@"%d",rockCount]);
    //make it rain
}

-(void)rockMove
{
    movement++;
    //int ran = xCount;
    int myX = _rockView.frame.origin.x;
    //int myY = _rockView.frame.origin.y;
    //[rockCollection addObject:newRockView];
    //[self.view addSubview:[rockCollection objectAtIndex:rockCount]];
    //[[rockCollection objectAtIndex:rockCount] setFrame:CGRectMake((30*ran), 0, 40, 40)];
    [self.view addSubview:newRockView];
    [_rockView setHidden:YES];
    [newRockView setFrame:CGRectMake(myX, movement, 40, 40)];
    if (CGRectIntersectsRect(self.view.frame, newRockView.frame)) {
        score = score - 100;
        //xCount = 30*(arc4random()%10);
        //score does not work right because my falling objects do not work right
    }
}
-(void)basketSpawn
{
    [_basketView setFrame:CGRectMake(120, 350, 80, 80)];
    [self rockMove];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint touchlocation = [touch locationInView:touch.self.view];
    _basketView.center = touchlocation;
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches]anyObject];
    CGPoint touchlocation = [touch locationInView:self.view];
    
    if(CGRectContainsPoint(self.basketView.frame, touchlocation))
    {
        CGPoint touchlocation = [touch locationInView:self.basketView];
        lastTouchSpot = [touch previousLocationInView:self.basketView];
        float deltax = touchlocation.x - lastTouchSpot.x;
        float deltay = touchlocation.y - lastTouchSpot.y;
        
        [self.basketView setFrame:CGRectMake(self.basketView.frame.origin.x+deltax, self.basketView.frame.origin.y+deltay, self.basketView.frame.size.width, self.basketView.frame.size.height)];
        
    }
    
    if (CGRectIntersectsRect(self.basketView.frame, newRockView.frame))
    {
        [newRockView setHidden:YES];
        score = score + 50;
        [moveTimer invalidate];
        //xCount = 30*(arc4random()%10);
        [_scoreDisplay setText:[NSString stringWithFormat:@"%d",score]];
    }
}

@end
