//
//  BookAssignmentLogicTests.m
//  BookAssignmentLogicTests
//
//  Created by Unbounded on 4/25/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "BookAssignmentLogicTests.h"
#import "BABook.h"
#import "BAViewController.h"

@implementation BookAssignmentLogicTests
{
    BABook *book1;
    BABook *book2;
    BABook *testBook;
    BAViewController *detailVC;
    NSString *testString;
}

- (void)setUp
{
    [super setUp];
    testBook = [[BABook alloc]init];
    book1 = [[BABook alloc]initWithTitle:@"Book1" WithGenre:@"New Genre" WithAuthor:@"Jo Schmo" WithNumberOfPages:@"5"];
    book2 = [[BABook alloc]initWithTitle:@"Book1" WithGenre:@"New Genre" WithAuthor:@"Jo Schmo" WithNumberOfPages:@"5"];
    STAssertNotNil(testBook, @"The Book is not empty... Somehow");
    [self testExample];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void)testExample
{
    detailVC = [[BAViewController alloc]initWithNibName:@"BAViewController" bundle:nil];
    [testString initWithString:@"William Shakespeare"];
    [testBook initWithTitle:@"Test" WithGenre:@"Unit Testing" WithAuthor:@"Me" WithNumberOfPages:@"10"];
    //STFail(@"Unit tests are not implemented yet in BookAssignmentLogicTests");
    STAssertNotNil([[BABook alloc]initWithTitle:@"Something" WithGenre:@"Some Type" WithAuthor:@"Some Author" WithNumberOfPages:@"5"], @"The Book is Empty!");
    STAssertEqualObjects(book1, book1, @"These books are not the same!");
    detailVC.lblAuthor.text = @"William Shakespeare";
    STAssertEquals(detailVC.lblAuthor.text,testString, @"Looks like our author isn't who he thinks he is!");
    
}

@end
