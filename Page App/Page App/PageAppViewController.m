//
//  PageAppViewController.m
//  Page App
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "PageAppViewController.h"
#import "ViewController.h"

@interface PageAppViewController ()

@end

@implementation PageAppViewController

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
    
    //finally create the pageview controller
    [self createContent];
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    
    
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:
        UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:options];
    
    [_pageViewController setDataSource:self];
    [[_pageViewController view]setFrame:[self view].bounds];
    
    ViewController *initialContentVC = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialContentVC];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    //Code to change size of inner frame that contains the chapter pages
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createContent
{
    NSMutableArray *chapterMutable = [[NSMutableArray alloc]init];
    for(int i=0;i<10;i++)
    {
        [chapterMutable addObject:[NSString stringWithFormat:@"CHAPTER %d",i+1]];
    }
    _chapter = chapterMutable;
    NSMutableArray *chapterTextMutable = [[NSMutableArray alloc]init];
    for(int i=0;i<10;i++)
    {
        [chapterTextMutable addObject:[NSString stringWithFormat:@"This is the text for chapter %d",i+1]];
    }
    _chapterText = chapterTextMutable;
}

-(ViewController*)viewControllerAtIndex:(NSUInteger)index
{
    //return the data view controller for the given index
    if(index > _chapter.count - 1)
    {
        return nil;
    }
    
    //create a new content page and return
    ViewController *contentView = [[ViewController alloc]init];
    [contentView setDataObject1:[_chapter objectAtIndex:index]];
    [contentView setDataObject2:[_chapterText objectAtIndex:index]];
    return contentView;
    
}

-(NSUInteger)indexOfViewController:(ViewController*)viewController
{
    return [_chapter indexOfObject:viewController.dataObject1];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ViewController*)viewController];
    if(index == 0 || index == NSNotFound)
    {
        return nil;
    }
    
    index --;
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(ViewController*)viewController];
    if(index == NSNotFound)
    {
        return nil;
    }
    
    index ++;
    return [self viewControllerAtIndex:index];
}

@end
