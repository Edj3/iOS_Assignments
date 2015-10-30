//
//  DetailViewController.h
//  iCloudAssignment
//
//  Created by Unbounded on 5/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STESimpleTextDocument.h"

@interface DetailViewController : UIViewController
<STESimpleTextDocumentDelegate>

@property (strong, nonatomic) NSURL *detailItem;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
