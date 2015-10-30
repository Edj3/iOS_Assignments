//
//  FlickrPhotoCell.h
//  Flickr Search
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import "FlickrPhoto.h"

@class FlickrPhoto;
@interface FlickrPhotoCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;
@end
