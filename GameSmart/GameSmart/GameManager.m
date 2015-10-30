//
//  GameManager.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager
@synthesize loadCount;

#pragma mark Singleton Methods

+(id)sharedManager{
    static GameManager *sharedManager;
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
        self.gameSearched = [[NSString alloc]init];
        self.nameOfGame = [[NSString alloc]init];
        self.expectedRelease = [[NSString alloc]init];
        self.description = [[NSString alloc]init];
        self.arrayGames = [[NSMutableArray alloc]init];
        self.defaults = [[NSUserDefaults alloc]init];
        self.arraySavedGames = [[NSMutableArray alloc]init];
        self.chosenGame = [[Game alloc]init];
    }
    return self;
}

@end
