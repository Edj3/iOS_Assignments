//
//  myAnnotation.h
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface myAnnotation : NSObject <MKAnnotation>

//Map Properties
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) NSString *subtitle;

//Map instance function
-(id)initWithCoordinate:(CLLocationCoordinate2D)c
              WithTitle: (NSString*)t
           WithSubtitle: (NSString*)s;
@end
