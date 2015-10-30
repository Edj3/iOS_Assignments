//
//  DetailSearchViewController.m
//  GameSmart
//
//  Created by Unbounded on 4/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "DetailSearchViewController.h"

@interface DetailSearchViewController (){
    GameManager *shared;
}

@end

@implementation DetailSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    shared = [GameManager sharedManager];
    self.detailSearchView.editable = NO;
    self.navigationItem.title = [[shared.arrayGames objectAtIndex:shared.searchIndex]name];
    UIImage *gameImage=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[shared.arrayGames objectAtIndex:shared.searchIndex]bigImage]]]];
    NSLog(@"%@",self.detailSearchView.text);
    [self.detailSearchImage setImage:gameImage];
    self.detailSearchView.text = [NSString stringWithFormat:@"Name: %@\nExpected Release Date: %@",[[shared.arrayGames objectAtIndex:shared.searchIndex] name],[[shared.arrayGames objectAtIndex:shared.searchIndex] expectedRelease]];
    //[[shared.arrayGames objectAtIndex:shared.searchIndex] expectedRelease];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
