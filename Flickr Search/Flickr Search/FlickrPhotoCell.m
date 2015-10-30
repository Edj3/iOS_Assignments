//
//  FlickrPhotoCell.m
//  Flickr Search
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@implementation FlickrPhotoCell

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        bgView.backgroundColor = [UIColor blueColor];
        bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
        bgView.layer.borderWidth = 4;
        self.selectedBackgroundView = bgView;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void) setPhoto:(FlickrPhoto *)photo {
    
    if(_photo != photo) {
        _photo = photo;
    }
    self.imageView.image = _photo.thumbnail;
}

@end
