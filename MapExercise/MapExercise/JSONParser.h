//
//  JSONParser.h
//  MapExercise
//
//  Created by Unbounded on 4/27/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyManager.h"
#import "MasterViewController.h"

@interface JSONParser : NSObject
-(void)sendJSONRequest;
- (void)parseJSON:(NSData*)data;
@end
