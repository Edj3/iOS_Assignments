//
//  Tab2ViewController.m
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Tab2ViewController.h"
#import "ViewController.h"
@interface Tab2ViewController ()
{
    NSInteger rowCount;
}
@end

@implementation Tab2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    ViewController *vc1 = [[self.tabBarController viewControllers] objectAtIndex:0];
    self.displayTab2.text = vc1.field1Tab1.text;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    rowCount = 0;
    //have vc2 observe notification of vc1
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useNotificationNumRows:) name:@"vc1pass" object:nil];
    ViewController *vc1 = [[self.tabBarController viewControllers] objectAtIndex:0];
    [self watchVC1:vc1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rowCount;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"There should be %d rows",rowCount];
    return cell;
}

- (IBAction)switchTab2:(id)sender {
    
}

-(void)useNotificationNumRows:(NSNotification*)notification{
    NSDictionary *tab1Info = [notification userInfo];
    ViewController *vc1 = [tab1Info objectForKey:@"pass"];
    if ([vc1.field2Tab1.text intValue]) {
        rowCount = [vc1.field2Tab1.text intValue];
        NSLog(@"Received Notification");
        [self.myTableView reloadData];
    }
    
}

-(void)watchVC1:(ViewController*)vc1{
    [vc1 addObserver:self forKeyPath:@"myNewSwitch.on" options:0 context:nil];
    NSLog(@"Watching Switch on VC1");
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"Should switch tab to yes or no");
    if ([[object valueForKeyPath:keyPath] boolValue]) {
        self.switchTab2.on = YES;
    }else{
        self.switchTab2.on = NO;
    }
    
}

@end
