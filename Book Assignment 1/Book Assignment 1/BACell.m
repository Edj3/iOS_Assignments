//
//  BACell.m
//  Book Assignment 1
//
//  Created by Unbounded on 3/30/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "BACell.h"

@implementation BACell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
