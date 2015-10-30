//
//  Game.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Game.h"

@implementation Game

-(id)init{
    self = [super init];
    if (self) {
        self.name = [[NSString alloc]init];
        self.platform = [[NSString alloc]init];
        self.expectedRelease = [[NSString alloc]init];
        self.originalRelease = [[NSString alloc]init];
        self.bigImage = [[NSString alloc]init];
        self.smallImage = [[NSString alloc]init];
        self.description = [[NSString alloc]init];
        self.rating = [[NSString alloc]init];
    }
    return self;
}

@end
