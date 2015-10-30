//
//  STESimpleTextDocument.h
//  iCloudAssignment
//
//  Created by Unbounded on 5/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STESimpleTextDocument;

@protocol STESimpleTextDocumentDelegate;
@protocol STESimpleTextDocumentDelegate <NSObject>
@optional
- (void)documentContentsDidChange:(STESimpleTextDocument*)document;

@end

@interface STESimpleTextDocument : UIDocument

@property (weak, nonatomic) id<STESimpleTextDocumentDelegate> delegate;
@property (copy, nonatomic) NSString* documentText;

@end
