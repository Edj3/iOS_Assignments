//
//  database.m
//  Weekend2Assignment
//
//  Created by Unbounded on 4/25/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "Database.h"

@implementation Database{
    sqlite3 *db;
}
-(id)initWithDatabasePath:(NSString *)path WithSQLStatement:(NSString *)sqlStatement{
    self = [super init];
    if (self) {
        const char* cPath = [path UTF8String];
        const char* cSQLStatement = [sqlStatement UTF8String];
        char* error;
        NSFileManager* nsfm = [NSFileManager defaultManager];
        if (![nsfm fileExistsAtPath:path]) {
            if (sqlite3_open(cPath, &db) == SQLITE_OK) {
                if (sqlite3_exec(db, cSQLStatement, NULL, NULL, &error) == SQLITE_OK) {
                    NSLog(@"Successfully created a new SQLite file");
                } else {
                    NSLog(@"Error: %s", error);
                }
                sqlite3_close(db);
            }
        } else {
            NSLog(@"File already exists.");
        }
    }
    return self;
}

-(void)savePerson:(Person*)person toDatabasePath:(NSString*)path{
    const char* cPath = [path UTF8String];
    char* error;
    const char *first = [person.personFirst UTF8String];
    const char *mid = [person.personMid UTF8String];
    const char *last = [person.personLast UTF8String];
    const char *depart = [person.personDepart UTF8String];
    const char *dob = [person.personDOB UTF8String];
    NSString *stringQuery = [NSString stringWithFormat:@"INSERT INTO Person VALUES ('%s', '%s', '%s', '%s', '%s')",first, mid, last, depart, dob];
    const char* query = [stringQuery UTF8String];
    NSFileManager *fileManage = [NSFileManager defaultManager];
    if([fileManage fileExistsAtPath:path]){
        if (sqlite3_open(cPath, &db) == SQLITE_OK){
            if (sqlite3_exec(db, query, NULL, NULL, &error)) {
                sqlite3_close(db);
                NSLog(@"Database Error: %s",error);
            }else{
                NSLog(@"%@ %@ was just added to Database.",person.personFirst,person.personLast);
            }
        }
    }else{
        NSLog(@"Invalid path.");
    }
}

-(NSArray*)readDataFromPath:(NSString*)path{
    NSMutableArray *returnData = [[NSMutableArray alloc]init];
    sqlite3_stmt *result;
    const char *cPath = [path UTF8String];
    const char *cQuery = "SELECT * FROM Person";
    
    if (sqlite3_open(cPath, &db) == SQLITE_OK) {
        if (sqlite3_prepare(db, cQuery, -1, &result, NULL) == SQLITE_OK) {
            while (sqlite3_step(result) == SQLITE_ROW) {
                Person *existingPerson = [[Person alloc]initWithFirstName:[NSString stringWithUTF8String:(const char *)sqlite3_column_text(result,0)] WithMiddleName:[NSString stringWithUTF8String:(const char*)sqlite3_column_text(result, 1)] WithLastName:[NSString stringWithUTF8String:(const char*)sqlite3_column_text(result, 2)] WithDepartment:[NSString stringWithUTF8String:(const char*)sqlite3_column_text(result, 3)] WithDOB:[NSString stringWithUTF8String:(const char*)sqlite3_column_text(result, 4)]];
                [returnData addObject:existingPerson];
            }
        }
    }
    NSLog(@"Read in %d people from last session.",[returnData count]);
    return returnData;
}

-(void)deletePerson:(Person*)person fromDatabasePath:(NSString*)path{
    const char *cPath = [path UTF8String];
    char* error;
    const char *first = [person.personFirst UTF8String];
    const char *mid = [person.personMid UTF8String];
    const char *last = [person.personLast UTF8String];
    const char *depart = [person.personDepart UTF8String];
    const char *dob = [person.personDOB UTF8String];
    const char *query = [[NSString stringWithFormat: @"DELETE FROM Person WHERE rowid IN (SELECT max(rowid) FROM Person WHERE firstname IS '%s' AND middlename IS '%s' AND lastname IS '%s' AND department IS '%s' AND dob IS '%s')",
                          first, mid, last, depart, dob] UTF8String];
    NSFileManager *fileManage = [NSFileManager defaultManager];
    if ([fileManage fileExistsAtPath:path]) {
        if (sqlite3_open(cPath, &db) == SQLITE_OK) {
            if (sqlite3_exec(db, query, NULL, NULL, &error) == SQLITE_OK) {
                sqlite3_close(db);
            }else{
                NSLog(@"Error: %s",error);
            }
        }
    }else{
        NSLog(@"Invalid Path Boy.");
    }
}

//-(int)countData:fromDatabasePath:(NSString*)path{
//    int returnData;
//    NSString *count;
//    sqlite3_stmt *result;
//    const char *cPath = [path UTF8String];
//    const char *cQuery = "SELECT (DISTINCT COUNT(department)) FROM Person";
//    
//    {
//        if (sqlite3_prepare(db, cQuery, -1, &result, NULL) == SQLITE_OK) {
//            while (sqlite3_step(result) == SQLITE_ROW) {
//                count = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(result,0)];
//                returnData = [count intValue];
//            }
//        }
//    }
//    NSLog(@"Read in %d people from last session.",returnData);
//    return returnData;
//}
@end
