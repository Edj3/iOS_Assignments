//
//  ViewController.m
//  Flickr Search
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"
#import "FlickrPhoto.h"
#import "FlickrPhotoCell.h"
#import "FlickrPhotoHeaderView.h"
#import "FlickrPhotoViewController.h"


@interface ViewController () 

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
    
    UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
    [self.toolbar setBackgroundImage:navBarImage forToolbarPosition:UIToolbarPositionAny
                          barMetrics:UIBarMetricsDefault];
    
    UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
    [self.shareButton setBackgroundImage:shareButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *textFieldImage = [[UIImage imageNamed:@"search_field.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.textField setBackground:textFieldImage];
    
    _searches = [@[] mutableCopy];
    _searchResults = [@{} mutableCopy];
    _flickr = [[Flickr alloc]init];
    self.selectedPhotos = [@[] mutableCopy];
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"FlickrCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shareButtonTapped:(id)sender {
    UIBarButtonItem *shareButton = (UIBarButtonItem *)sender;
    // 1
    if (!self.sharing) {
        self.sharing = YES;
        [shareButton setStyle:UIBarButtonItemStyleDone];
        [shareButton setTitle:@"Done"];
        [self.collectionView setAllowsMultipleSelection:YES];
    } else {
        // 2
        self.sharing = NO;
        [shareButton setStyle:UIBarButtonItemStyleBordered];
        [shareButton setTitle:@"Share"];
        [self.collectionView setAllowsMultipleSelection:NO];
        // 3
        if ([self.selectedPhotos count] > 0) {
            [self showMailComposerAndSend];
        }
        // 4
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        [self.selectedPhotos removeAllObjects];
    }
}

#pragma mark - UITextFieldDelegate methods
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    // 1
    [self.flickr searchFlickrForTerm:textField.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error) {
        if(results && [results count] > 0) {
            // 2
            if(![self.searches containsObject:searchTerm]) {
                NSLog(@"Found %d photos matching %@", [results count],searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results; }
            // 3
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        } else { // 1
            NSLog(@"Error searching Flickr: %@", error.localizedDescription);
        } }];
    [textField resignFirstResponder];

    return YES; 
}

#pragma mark - UICollectionView Datasource
// 1
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm] count];
}
// 2
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return [self.searches count];
}
// 3
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FlickrPhotoCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"FlickrCell" forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section];
    cell.photo = self.searchResults[searchTerm]
    [indexPath.row];
    return cell;
}
// 4
- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    FlickrPhotoHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                         UICollectionElementKindSectionHeader withReuseIdentifier:@"FlickrPhotoHeaderView" forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section]; [headerView setSearchText:searchTerm];
    return headerView;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.sharing) {
        NSString *searchTerm = self.searches[indexPath.section];
        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self performSegueWithIdentifier:@"ShowFlickrPhoto"
                                  sender:photo];
        [self.collectionView
         deselectItemAtIndexPath:indexPath animated:YES];
    } else {
        NSString *searchTerm = self.searches[indexPath.section];
        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self.selectedPhotos addObject:photo];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sharing) {
        NSString *searchTerm = self.searches[indexPath.section];
        FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
        [self.selectedPhotos removeObject:photo];
    }
}

#pragma mark – UICollectionViewDelegateFlowLayout

// 1
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *searchTerm = self.searches[indexPath.section]; FlickrPhoto *photo =
    self.searchResults[searchTerm][indexPath.row];
    // 2
    CGSize retval = photo.thumbnail.size.width > 0 ? photo.thumbnail.size : CGSizeMake(100, 100);
    retval.height += 35; retval.width += 35; return retval;
}

// 3
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(50, 20, 50, 20);
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowFlickrPhoto"]) {
        FlickrPhotoViewController *flickrPhotoViewController = segue.destinationViewController;
        flickrPhotoViewController.flickrPhoto = sender;
    }
}

-(void)showMailComposerAndSend {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"Check out these Flickr Photos"];
        NSMutableString *emailBody = [NSMutableString string];
        for(FlickrPhoto *flickrPhoto in self.selectedPhotos)
        {
            NSString *url = [Flickr flickrPhotoURLForFlickrPhoto: flickrPhoto size:@"m"];
            [emailBody appendFormat:@"<div><img src='%@'></div><br>",url];
        }
        [mailer setMessageBody:emailBody isHTML:YES];
        [self presentViewController:mailer animated:YES completion:^{}];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mail Failure" message:@"Your device doesn't support in-app email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)mailComposeController: (MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:^{}];
}
@end
