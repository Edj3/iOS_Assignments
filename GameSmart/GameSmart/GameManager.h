//
//  GameManager.h
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface GameManager : NSObject

@property (assign,nonatomic) int loadCount;
@property (strong,nonatomic) NSString *gameSearched;
@property (strong,nonatomic) NSString *nameOfGame;
@property (strong,nonatomic) NSString *expectedRelease;
@property (strong,nonatomic) NSString *description;
@property (strong,nonatomic) NSMutableArray *arrayGames;
@property (strong,nonatomic) NSMutableArray *arraySavedGames;
@property (strong,nonatomic) NSUserDefaults *defaults;
@property (assign,nonatomic) int searchIndex;
@property (strong,nonatomic) Game *chosenGame;

+(id)sharedManager;

@end
