//
//  PersonDetailViewController.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "PersonDetailViewController.h"

    
@interface PersonDetailViewController ()
@end

@implementation PersonDetailViewController

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
    [self.detailFirstName setText:self.collectPerson.personFirst];
    [self.detailMidName setText:self.collectPerson.personMid];
    [self.detailLastName setText:self.collectPerson.personLast];
    [self.detailDepartName setText:self.collectPerson.personDepart];
    [self.detailDOB setText:self.collectPerson.personDOB];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
