//
//  CollectionViewController.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController{
    GameManager *shared;
}

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
	// Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    shared = [GameManager sharedManager];
    UIImage *gameImage=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[shared.arrayGames objectAtIndex:shared.searchIndex]bigImage]]]];
    [self.showCase setImage:gameImage];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
