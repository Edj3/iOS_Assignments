//
//  DetailViewController.h
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SearchViewController.h"
#import "MyManager.h"
#import "MapRestaurant.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate,UIPopoverControllerDelegate,MKMapViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet MKMapView *myMap;
@property (strong, nonatomic) UIPopoverController *popSearch;
@property (strong, nonatomic) UIButton *mapButton;
- (IBAction)triggerSearchPopover:(id)sender;

@end
