//
//  MapRestaurant.h
//  MapExercise
//
//  Created by Unbounded on 4/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MapRestaurant : NSObject

@property (strong,nonatomic) NSString *latitude;
@property (strong,nonatomic) NSString *longitude;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *address;

-(id)initWithLatitude:(NSString*)lat
        WithLongitude:(NSString*)lng
             WithName:(NSString*)n
          WithAddress:(NSString*)add;

@end
