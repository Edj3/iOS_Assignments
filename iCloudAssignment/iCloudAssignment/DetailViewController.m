//
//  DetailViewController.m
//  iCloudAssignment
//
//  Created by Unbounded on 5/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController{
    STESimpleTextDocument* _document;
}
@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem
//{
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//        
//        // Update the view.
//        [self configureView];
//    }
//}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)keyboardWillHide:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey]
                       doubleValue];
    
    // Reset the text view's bottom content inset.
    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom = 0;
    
    [UIView animateWithDuration:duration animations:^{
        self.textView.contentInset = insets;
    }];
}

- (void)keyboardWillShow:(NSNotification*)aNotification {
    NSDictionary* info = [aNotification userInfo];
    CGRect kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey]
                     CGRectValue];
    double duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey]
                       doubleValue];
    
    UIEdgeInsets insets = self.textView.contentInset;
    insets.bottom += kbSize.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.textView.contentInset = insets;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Clear out the text view contents.
    self.textView.text = @"";
    
    // Create the document and assign the delegate.
    _document = [[STESimpleTextDocument alloc] initWithFileURL:self.detailItem];
    _document.delegate = self;
    
    // If the file exists, open it; otherwise, create it.
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:[self.detailItem path]])
        [_document openWithCompletionHandler:nil];
    else
        // Save the new document to disk.
        [_document saveToURL:self.detailItem
            forSaveOperation:UIDocumentSaveForCreating
           completionHandler:nil];
    
    // Register for the keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSString* newText = self.textView.text;
    _document.documentText = newText;
    
    // Close the document.
    [_document closeWithCompletionHandler:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)documentContentsDidChange:(STESimpleTextDocument *)document {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.textView.text = document.documentText;
    });
}

@end
