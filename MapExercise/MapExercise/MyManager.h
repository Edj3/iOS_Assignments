//
//  MyManager.h
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyManager : NSObject

@property (strong,nonatomic) NSString *cityGlobal;
@property (strong,nonatomic) NSString *stateGlobal;
@property (strong, nonatomic) NSString *myLatGlobal;
@property (strong, nonatomic) NSString *myLngGlobal;
@property (strong,nonatomic) NSString *restLat;
@property (strong,nonatomic) NSString *restLng;
@property (strong, nonatomic) NSString *restName;
@property (strong, nonatomic) NSString *restAddress;
@property (strong,nonatomic) NSMutableArray *restLatArray;
@property (strong,nonatomic) NSMutableArray *restLngArray;
@property (strong,nonatomic) NSMutableArray *restNameArray;
@property (strong,nonatomic) NSMutableArray *restAddressArray;
@property (strong,nonatomic) NSNumber *clickedLat;
@property (strong,nonatomic) NSNumber *clickedLng;
@property (strong, nonatomic) NSString *clickedName;
@property (strong, nonatomic) NSString *clickedAddress;
@property (strong, nonatomic) UIButton *mapButton;

+(id)sharedManager;

@end
