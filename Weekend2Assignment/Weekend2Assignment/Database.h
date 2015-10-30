//
//  database.h
//  Weekend2Assignment
//
//  Created by Unbounded on 4/25/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Person.h"

@interface Database : NSObject

-(id)initWithDatabasePath:(NSString*)path
         WithSQLStatement:(NSString*)sqlStatement;
-(void)savePerson:(Person*)person toDatabasePath:(NSString*)path;
-(void)deletePerson:(Person*)person fromDatabasePath:(NSString*)path;
-(NSArray*)readDataFromPath:(NSString*)path;
@end
