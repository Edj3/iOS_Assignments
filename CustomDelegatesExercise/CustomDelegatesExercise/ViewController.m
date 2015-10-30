//
//  ViewController.m
//  CustomDelegatesExercise
//
//  Created by Unbounded on 5/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGFloat sliderColorPosition = 0.3f;
    self.view.backgroundColor = [UIColor colorWithRed:sliderColorPosition green:sliderColorPosition blue:sliderColorPosition alpha:1.0f];
    
    CGRect redSliderFrame = CGRectMake(20.0f, 20.0f, 280.0f, 28.0f);
    MTSlider *redSlider = [[MTSlider alloc]initWithFrame:redSliderFrame andDelegate:self];
    redSlider.tag = 1;
    [self.view addSubview:redSlider];
    
    CGRect greenSliderFrame = CGRectMake(20.0f, 70.0f, 280.0f, 28.0f);
    MTSlider *greenSlider = [[MTSlider alloc]initWithFrame:greenSliderFrame andDelegate:self];
    greenSlider.tag = 2;
    [self.view addSubview:greenSlider];
    
    CGRect blueSliderFrame = CGRectMake(20.0f, 120.0f, 280.0f, 28.0f);
    MTSlider *blueSlider = [[MTSlider alloc]initWithFrame:blueSliderFrame andDelegate:self];
    blueSlider.tag = 3;
    [self.view addSubview:blueSlider];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)startPositionForMTSlider:(MTSlider *)MTSlider{
    
}

-(void)MTSliderDidChange:(MTSlider *)MTSlider withValue:(CGFloat)value{
    if (MTSlider.tag == 1) {
        CGColorRef bgColor = self.view.backgroundColor.CGColor;
        const CGFloat *colorsPointer = CGColorGetComponents(bgColor);
        CGFloat currentGreen = colorsPointer[1];
        CGFloat currentBlue = colorsPointer[2];
        self.view.backgroundColor = [UIColor colorWithRed:value green:currentGreen blue:currentBlue alpha:1.0f];
    }
    
    if (MTSlider.tag == 2) {
        CGColorRef bgColor = self.view.backgroundColor.CGColor;
        const CGFloat *colorsPointer = CGColorGetComponents(bgColor);
        CGFloat currentRed = colorsPointer[0];
        CGFloat currentBlue = colorsPointer[2];
        self.view.backgroundColor = [UIColor colorWithRed:currentRed green:value blue:currentBlue alpha:1.0f];
    }
    
    if (MTSlider.tag == 3) {
        CGColorRef bgColor = self.view.backgroundColor.CGColor;
        const CGFloat *colorsPointer = CGColorGetComponents(bgColor);
        CGFloat currentRed = colorsPointer[0];
        CGFloat currentGreen = colorsPointer[1];
        self.view.backgroundColor = [UIColor colorWithRed:currentRed green:currentGreen blue:value alpha:1.0f];
    }
}

@end
