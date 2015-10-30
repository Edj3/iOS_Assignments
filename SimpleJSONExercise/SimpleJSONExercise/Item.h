//
//  Item.h
//  SimpleJSONExercise
//
//  Created by Unbounded on 4/18/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (strong,nonatomic) NSString *type;
@property (strong,nonatomic) NSString *data;

-(id)initWithType: (NSString*) itemType
         WithData: (NSString*) itemData;
@end
