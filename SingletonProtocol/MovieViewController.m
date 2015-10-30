//
//  MovieViewController.m
//  SingletonProtocol
//
//  Created by Unbounded on 4/11/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MovieViewController.h"
#import "MyTableViewController.h"
#import "SharedResource.h"
#import "MyTableCell.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

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
    self.movieInput.delegate = self;
    self.yearInput.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)popToRoot:(id)sender {
    //instantiate view controller of next controller by using nib name as identifier
    //MyTableViewController *vc1 = [[MyTableViewController alloc]initWithNibName:@"MyTableViewController" bundle:nil];
    SharedResource *sr = [SharedResource getResource];
    sr.myGlobalMovie = [[Movie alloc]initWithMovieTitle:self.movieInput.text
                MovieYear:self.yearInput.text
                MovieCast:self.castInput];
    //[[sr myGlobalMovie] = [[Movie alloc] initWithMovieTitle:self.movieInput.text MovieYear:self.yearInput.text MovieCast:self.castInput]] ];
    [sr.myGlobalArray addObject:sr.myGlobalMovie];
    
    //pop to the root view controller
    [[self navigationController] popToRootViewControllerAnimated:YES];
}
@end
