//
//  BACell.h
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BACell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *lblTitle;
@property (weak,nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak,nonatomic) IBOutlet UILabel *lblNumberOfPages;

@end
