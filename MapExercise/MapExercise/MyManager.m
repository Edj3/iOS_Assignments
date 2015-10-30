//
//  MyManager.m
//  MapExercise
//
//  Created by Unbounded on 4/23/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "MyManager.h"

@implementation MyManager

#pragma mark Singleton Methods
+(id)sharedManager{
    static MyManager *sharedManager;
    if (!sharedManager) {
        sharedManager = [[super allocWithZone:nil]init];
    }
    return sharedManager;
}

+(id)allocWithZone:(NSZone *)zone{
    return [self sharedManager];
}

-(id)init{
    self = [super init];
    if (self) {
        self.cityGlobal = [[NSString alloc]init];
        self.stateGlobal = [[NSString alloc]init];
        self.myLatGlobal = [[NSString alloc]init];
        self.myLngGlobal = [[NSString alloc]init];
        self.restLat = [[NSString alloc]init];
        self.restLng = [[NSString alloc]init];
        self.restName = [[NSString alloc]init];
        self.restAddress = [[NSString alloc]init];
        self.restLatArray = [[NSMutableArray alloc]init];
        self.restLngArray = [[NSMutableArray alloc]init];
        self.restNameArray = [[NSMutableArray alloc]init];
        self.restAddressArray = [[NSMutableArray alloc]init];
        self.clickedLat = [[NSNumber alloc]init];
        self.clickedLng = [[NSNumber alloc]init];
        self.clickedName = [[NSString alloc]init];
        self.clickedAddress = [[NSString alloc]init];
        //self.mapButton = [[UIButton alloc]init];
    }
    return self;
}
@end
