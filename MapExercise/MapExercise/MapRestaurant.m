//
//  MapRestaurant.m
//  MapExercise
//
//  Created by Unbounded on 4/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MapRestaurant.h"

@implementation MapRestaurant
-(id)initWithLatitude:(NSString *)lat WithLongitude:(NSString *)lng WithName:(NSString *)n WithAddress:(NSString *)add{
    self = [super init];
    if (self) {
        self.latitude = lat;
        self.longitude = lng;
        self.name = n;
        self.address = add;
    }
    return self;
}
@end
