//
//  Game.h
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *platform;
@property (strong,nonatomic) NSString *expectedRelease;
@property (strong,nonatomic) NSString *originalRelease;
@property (strong,nonatomic) NSString *bigImage;
@property (strong,nonatomic) NSString *smallImage;
@property (strong,nonatomic) NSString *description;
@property (strong,nonatomic) NSString *rating;

-(id)init;

@end
