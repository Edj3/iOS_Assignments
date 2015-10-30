//
//  DetailViewController.m
//  Split View Exercise
//
//  Created by Unbounded on 4/3/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "BABook.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (IBAction)btnBookAdd:(id)sender {
    UINavigationController *nav = [[self.splitViewController viewControllers]objectAtIndex:0];
    MasterViewController *mv = [[nav viewControllers]objectAtIndex:0];
    
    //MasterViewController *mv= [[self.splitViewController viewControllers]objectAtIndex:0];
    
    BABook *bookAdd = [[BABook alloc]initWithTitle:_inputTitle.text WithGenre:_inputGenre.text WithAuthor:_inputAuthor.text WithNumberOfPages:_inputPages.text];
    [mv.myTableArray addObject:bookAdd];
    NSLog(@"The book should be added at this point");
    [mv.tableView reloadData];
}
@end
