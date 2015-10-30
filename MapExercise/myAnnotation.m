//
//  myAnnotation.m
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D)c WithTitle:(NSString *)t WithSubtitle:(NSString *)s{
    self = [super init];
    if (self) {
        _coordinate = c;
        _title = t;
        _subtitle = s;
    }
    return self;
}
@end
