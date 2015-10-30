//
//  ViewController.h
//  Flickr Search
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flickr.h"
#import "FlickrPhoto.h"
#import "FlickrPhotoHeaderView.h"
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController
<UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MFMailComposeViewControllerDelegate>

@property (weak,nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *shareButton;
@property (weak,nonatomic) IBOutlet UITextField *textField;
@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSMutableDictionary *searchResults;
@property(nonatomic,strong) NSMutableArray *searches;
@property(nonatomic,strong) Flickr *flickr;
@property(nonatomic, strong) NSMutableArray *selectedPhotos;
@property (nonatomic) BOOL sharing;


-(IBAction)shareButtonTapped:(id)sender;

@end
