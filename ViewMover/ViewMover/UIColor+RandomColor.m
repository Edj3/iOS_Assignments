//
//  UIColor+RandomColor.m
//  ViewMover
//
//  Created by Unbounded on 4/8/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+(UIColor*) RandomColor
{
    return [UIColor colorWithRed:drand48() green:drand48() blue:drand48() alpha:1.0];
}
@end
