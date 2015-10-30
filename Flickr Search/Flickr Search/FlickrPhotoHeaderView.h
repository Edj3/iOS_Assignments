//
//  FlickrPhotoHeaderView.h
//  Flickr Search
//
//  Created by Unbounded on 4/2/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlickrPhotoHeaderView : UICollectionReusableView
@property(weak) IBOutlet UIImageView *backgroundImageView;
@property(weak) IBOutlet UILabel *searchLabel;
-(void)setSearchText:(NSString *)text;
@end
