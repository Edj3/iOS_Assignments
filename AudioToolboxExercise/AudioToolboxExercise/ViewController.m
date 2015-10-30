//
//  ViewController.m
//  AudioToolboxExercise
//
//  Created by Unbounded on 4/24/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    SystemSoundID toneSSIDs[10];
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)registerSoundClips:(UIButton*)pressedButton{
    for (int count = 0; count < 10; count++) {
        NSString *toneFileName = [NSString stringWithFormat:@"%d", count];
        NSURL *toneURLRef = [[NSBundle mainBundle] URLForResource:toneFileName withExtension:@"wav"];
        SystemSoundID toneSSID;
        AudioServicesCreateSystemSoundID((__bridge_retained CFURLRef)toneURLRef, &toneSSID);
        toneSSIDs [count] = toneSSID;
    }
}

-(IBAction)numberButtonPressed:(UIButton*)pressedButton{
    int toneIndex = [pressedButton.titleLabel.text intValue];
    SystemSoundID toneSSID = toneSSIDs[toneIndex];
    AudioServicesPlaySystemSound(toneSSID);
    [self registerSoundClips:pressedButton];
}


@end
