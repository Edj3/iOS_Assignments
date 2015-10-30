//
//  JSONParser.h
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"
#import "Game.h"
#import "SearchViewController.h"

@interface JSONParser : NSObject
-(void)sendJSONRequest;
- (void)parseJSON:(NSData*)data;
@end
