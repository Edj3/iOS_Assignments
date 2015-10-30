//
//  ViewController.m
//  BlockAssignment
//
//  Created by Unbounded on 4/14/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSOperationQueue *queue;
    float progressRatio;
    int numCount;
    int numCount2;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numCount = 0;
    numCount = 25000;
    [self.myBar setProgress:(float)0.5];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startCount:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        for (int i = 5000; i <=15000; i++) {
            NSLog(@"%d",i);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.progressLabel setText:[NSString stringWithFormat:@"%d",i]];
                
                numCount = i;
                //if the count can be divided by 100 and have a remainder of 0, then set the progress of the bar to the progressratio
                
//                if (numCount % 100 == 0) {
//                    progressRatio = (float)numCount / (float)(numCount2 + numCount);
//                    //YOU ARE HERE FINISH
//                    
//                    [self.numLabel setText:[NSString stringWithFormat:@"%f",progressRatio]];
//                }
                
            });
        }
    });
    
    queue = [NSOperationQueue new];
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadDataForOperation) object:nil];
    [queue addOperation:operation];
}

-(void)loadDataForOperation{
    for (int i = 25000; i >= 10000; i--) {
        [self performSelectorOnMainThread:@selector(setTextOnLabel:) withObject:[NSNumber numberWithInt:i] waitUntilDone:YES];
        numCount2 = i;
        //NSNumber *newnum = ;
        //[self setTextOnLabel:newnum];
        //if the count can be divided by 100 and have a remainder of 0, then set the progress of the bar to the progressratio
//        if (numCount2 % 100 == 0) {
//            progressRatio = (float)numCount / (float)(numCount + numCount2);
//            //YOU ARE HERE FINISH
//            [self.newBar setProgress:progressRatio animated:YES];
//            [self.numLabel setText:[NSString stringWithFormat:@"%f",progressRatio]];
//        }
    }
}

-(void)setTextOnLabel:(NSNumber*)num{
    [self.progressLabel2 setText:[NSString stringWithFormat:@"%d",[num intValue]]];
    NSLog(@"%d",[num intValue]);
}

@end
