//
//  Item.m
//  SimpleJSONExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Item.h"

@implementation Item
-(id)initWithType:(NSString *)itemType WithData:(NSString *)itemData{
    self = [super init];
    if (self) {
        _type = itemType;
        _data = itemData;
        
    }
    return self;
}

@end
