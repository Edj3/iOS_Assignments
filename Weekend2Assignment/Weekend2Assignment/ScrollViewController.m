//
//  ScrollViewController.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/6/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
{
    NSUInteger scrollIndex;
    NSUInteger imageCount;
   
}
@end

@implementation ScrollViewController

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
    
    //initialize all images as UIImages
    UIImage *imageToLoad1 = [UIImage imageNamed:@"SephirothFFCrisis.jpg"];
    UIImage *imageToLoad2 = [UIImage imageNamed:@"CidFF7.jpg"];
    UIImage *imageToLoad3 = [UIImage imageNamed:@"CloudFF7.jpg"];
    UIImage *imageToLoad4 = [UIImage imageNamed:@"TifaFF7.jpg"];
    UIImage *imageToLoad5 = [UIImage imageNamed:@"VincentFF7.bmp"];
    
    //create and alloc the imageviews that will contain the images. All the images need to be imageviews so that they can be placed into the scrollview
    _image1 = [[UIImageView alloc]initWithImage:imageToLoad1];
    _image2 = [[UIImageView alloc]initWithImage:imageToLoad2];
    _image3 = [[UIImageView alloc]initWithImage:imageToLoad3];
    _image4 = [[UIImageView alloc]initWithImage:imageToLoad4];
    _image5 = [[UIImageView alloc]initWithImage:imageToLoad5];
    
    
    
    //initialize the array to contain all of the views of your images
    _imageViewCollection = [[NSMutableArray alloc]initWithObjects:_image1,_image2,_image3,_image4,_image5, nil];
    
    //Initialize the index that will control the number of images displayed
    scrollIndex = 0;
    
    //initialize scrollview and set initial settings
    _myScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    _myScrollView.userInteractionEnabled = YES;
    [self.myScrollView setPagingEnabled:YES];
    [self.view addSubview:self.myScrollView];
    
   
    
    //loop thru and display image views as a subview on the scroll view. Also, make sure each one starts where the next one ends by multiply origin by i
    for (int i = 0; i < [_imageViewCollection count]; i++)
    {
        [self.myScrollView addSubview:[self.imageViewCollection objectAtIndex:i]];
        [[_imageViewCollection objectAtIndex:i] setFrame:CGRectMake(320*i, 40,320, 340)];
        [[_imageViewCollection objectAtIndex:i] setContentMode:UIViewContentModeScaleAspectFill];
        [[_imageViewCollection objectAtIndex:i] setClipsToBounds:YES];
    }
    self.myScrollView.contentSize = CGSizeMake(320*[_imageViewCollection count],460);
    
    //Set page control to start with the 5 images
     UIPageControl *myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(150, 100, 50, 50)];
    [_myPageControl setNumberOfPages:5];
    [self.view addSubview:myPageControl];
    
    //default iphone frame dimensions are width of 320 pixels and length of 460 pixels!
    
    //generate buttons for view
    UIButton *buttonDelete = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonDelete setFrame:CGRectMake(10, 2, 100, 35)];
    [buttonDelete setTitle:@"Delete" forState:UIControlStateNormal];
    [buttonDelete addTarget:self action:@selector(deleteImage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonDelete];
    
    UIButton *buttonAdd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonAdd setFrame:CGRectMake(210, 2, 100, 35)];
    [buttonAdd setTitle:@"Add" forState:UIControlStateNormal];
    [buttonAdd addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonAdd];
    [self.myScrollView addSubview:myPageControl];
    imageCount = [_imageViewCollection count];
    
}


- (IBAction)deleteImage:(id)sender {
    //added if statement to ensure the images dont go below 1
    if (imageCount > 1) {
        //shrink the images by 1 on click of minus button
        self.myScrollView.contentSize = CGSizeMake(320*(imageCount-1),460);
        imageCount = imageCount - 1;
        //set page control to 0
        [_myPageControl setNumberOfPages:imageCount];
    }
}

- (IBAction)addImage:(id)sender {
    //added if statement to ensure the images don't go over 5 (there are 5 images total)
    if (imageCount < 5) {
        //grow the images by 1 on click of plus button
        self.myScrollView.contentSize = CGSizeMake(320*(imageCount+1),460);
        imageCount = imageCount +1;
        [_myPageControl setNumberOfPages:imageCount];
    }
    NSLog(@"Scroll View should grow and add 1 picture");
}

-(void)changePage:(UIPageControl *)sender
{
    NSLog(@"%d",sender.currentPage);
    [self.myScrollView setContentOffset:CGPointMake(_myScrollView.frame.size.width*sender.currentPage, 0)];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = self.myScrollView.contentOffset.x/self.myScrollView.frame.size.width;
    [_myPageControl setCurrentPage:page];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
