//
//  AddShowViewController.m
//  CoreDataExercise
//
//  Created by Unbounded on 4/17/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "AddShowViewController.h"

@interface AddShowViewController ()
{
    BOOL showAiring;
}
@end

@implementation AddShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.enterMainCharacter.delegate = self;
    self.enterSeason.delegate = self;
    self.enterShowTitle.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)isShowAiring:(id)sender {
    switch ([self.showSegment selectedSegmentIndex]) {
        case 0:
            showAiring = YES;
            self.airDisplay.text = @"YES";
            break;
        case 1:
            showAiring = NO;
            [self.airDisplay setText:@"NO"];
            break;
        default:
            break;
    }
}
@end
