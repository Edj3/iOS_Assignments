//
//  ViewController.m
//  ViewMover
//
//  Created by Unbounded on 4/8/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+RandomColor.h"

@interface ViewController ()
{
    NSTimer *myTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set background color of main view to black
    
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    //set up NSTimer object to iterate and move objects on repeat
    myTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(moveSquare) userInfo:nil repeats:YES];
    
    //set initial state of squares
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(30, 0, 20, 20)];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(90, 0, 20, 20)];
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(150, 0, 20, 20)];
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(210, 0, 20, 20)];
    UIView *view5 = [[UIView alloc]initWithFrame:CGRectMake(270, 0, 20, 20)];
    
    [view1 setBackgroundColor:[UIColor RandomColor]];
    [view2 setBackgroundColor:[UIColor RandomColor]];
    [view3 setBackgroundColor:[UIColor RandomColor]];
    [view4 setBackgroundColor:[UIColor RandomColor]];
    [view5 setBackgroundColor:[UIColor RandomColor]];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    
    //call the get squares function to initialize the subviews to move and create frames
    //[self getSquares];
    [self moveSquare];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getSquares
{
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

-(void)moveSquare
{
   
    NSArray *myArray;
    myArray = [self.view subviews];
    int index = rand() % [myArray count];
    //[[myArray objectAtIndex:index] setFrame:CGRectMake(30, 350, 20,20)];
    //CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0,-abs((rand()%101)));
    //[[myArray objectAtIndex:index]setTransform:transformTranslate];
    UIView *MyView = [[self.view subviews] objectAtIndex:index];
    int myX = MyView.frame.origin.x;
    int myY = MyView.frame.origin.y;
    //CGRect = MyView.frame;
    if (myY < 0) {
        [myTimer invalidate];
    }
    [UIView animateWithDuration:0.5 animations:^{
        [MyView setFrame:CGRectMake(myX,myY + (rand() % 51),20,20)];}];
    
    //400 - (rand() %101)
    //myArray = [self.view subviews];
}

@end