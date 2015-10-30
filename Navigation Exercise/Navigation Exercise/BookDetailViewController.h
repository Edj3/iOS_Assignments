//
//  BookDetailViewController.h
//  Navigation Exercise
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *bookName;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthor;
@property (weak, nonatomic) IBOutlet UILabel *bookPages;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisher;
@property (weak, nonatomic) IBOutlet UILabel *bookYear;
@property (weak, nonatomic) IBOutlet UILabel *bookLocation;

@end
