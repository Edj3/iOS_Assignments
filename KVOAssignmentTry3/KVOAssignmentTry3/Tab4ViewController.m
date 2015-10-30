//
//  Tab4ViewController.m
//  KVOAssignmentTry3
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Tab4ViewController.h"
#import "ViewController.h"

@interface Tab4ViewController ()
{
    Tab3ViewController *vc3;
    ViewController *vc1;
    int numberCount;
}

@end

@implementation Tab4ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //have vc4 observe notification of vc1
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useNotificationCheckSelected:) name:@"vc1checkselect" object:nil];
    vc3 = [[self.tabBarController viewControllers] objectAtIndex:2];
    [self watchVC3];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchTab4:(id)sender {
}

-(void)useNotificationCheckSelected:(NSNotification*)notification{
    NSDictionary *tab1Status = [notification userInfo];
    vc1 = [tab1Status objectForKey:@"tab1pass"];
    if (vc1.switchTab1.on) {
        self.switchTab4.on = YES;
    }else{
        self.switchTab4.on = NO;
    }
    NSLog(@"Notification from tab 1 received");
}

-(void)watchVC3{
    [vc3 addObserver:self forKeyPath:@"field1Tab3.text" options:0 context:nil];
    NSLog(@"Watching text field on vc3");
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //reverse the text
    NSMutableString *reversedString = [[NSMutableString alloc]init];
    NSString *myText = [object valueForKeyPath:keyPath];
    NSInteger charIndex = [myText length];
    while(myText && charIndex >=0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[myText substringWithRange:subStrRange]];
    }
    self.display1Tab4.text = reversedString;
    
    NSLog(@"Grabbed text from field in tab 3");
}

@end
