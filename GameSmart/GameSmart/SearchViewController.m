//
//  SearchViewController.m
//  GameSmart
//
//  Created by Unbounded on 4/29/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController (){
    GameManager *shared;
    float redTableTextValue,greenTableTextValue,blueTableTextValue;
    float redSearchValue,greenSearchValue,blueSearchValue;
    BOOL switchValue;
}

@end

@implementation SearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.searchTable reloadData];
    switchValue = [[NSUserDefaults standardUserDefaults] boolForKey:@"userSettings"];
    if (switchValue == YES) {
        [self customizeTableSettings];
    }else{
        [self.searchField setTextColor:[UIColor colorWithRed:0 green:100 blue:0 alpha:0.8f]];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initializeSetUp];
    //[self customizeTableSettings];
    //[self.searchField setTextColor:[UIColor colorWithRed:0 green:100 blue:0 alpha:0.8f]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    NSString *tempString = self.searchField.text;
    NSLog(@"The game you search for is: %@",tempString);
    shared.gameSearched = [tempString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSLog(@"JSON Search Name: %@",shared.gameSearched);
    JSONParser *parse = [[JSONParser alloc]init];
    [parse sendJSONRequest];
    return YES;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return shared.arrayGames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[shared.arrayGames objectAtIndex:indexPath.row] name];
    cell.backgroundColor = [UIColor colorWithRed:100 green:100 blue:100 alpha:0.8f];
    [cell.contentView setBackgroundColor:[UIColor colorWithRed:100 green:100 blue:100 alpha:0.8f]];
    [cell.textLabel setBackgroundColor:[UIColor colorWithRed:100 green:100 blue:100 alpha:0.8f]];
    [cell.detailTextLabel setBackgroundColor:[UIColor colorWithRed:100 green:100 blue:100 alpha:0.8f]];
    [self.searchTable setBackgroundColor:[UIColor colorWithRed:100 green:100 blue:100 alpha:0.8f]];
     
    //Table Settings
    if (switchValue == YES) {
        redTableTextValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"tblTextRed"];
        greenTableTextValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"tblTextGreen"];
        blueTableTextValue = [[NSUserDefaults standardUserDefaults] floatForKey:@"tblTextBlue"];
        [cell.textLabel setTextColor:[UIColor colorWithRed:redTableTextValue green:greenTableTextValue blue:blueTableTextValue alpha:1]];
    }else{
        [cell.textLabel setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    shared.chosenGame = [shared.arrayGames objectAtIndex:indexPath.row];
    shared.searchIndex = indexPath.row;
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([[segue identifier] isEqualToString:@"detailPush"]) {
//        DetailSearchViewController *dest = [segue destinationViewController];
//        dest.detailSearchView.text = shared.chosenGame.name;
//    }
//}

-(void)initializeSetUp{
    shared = [GameManager sharedManager];
    shared.loadCount++;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    self.searchField.delegate = self;
    self.searchTable.delegate = self;
    self.searchTable.dataSource = self;
    [self.searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    if (shared.loadCount == 1) {
        UIAlertView *welcomeMessage = [[UIAlertView alloc]initWithTitle:@"Welcome to GameSmart!" message:@"The app that lets you search for release dates and information on any game you want! \n\nSave the games you like so you can view them later. Don't forget to check out the album tab to view your games in style! \n\nClick 'Get Started' to begin your search!" delegate:self cancelButtonTitle:@"Get Started" otherButtonTitles:nil, nil];
        [welcomeMessage show];
    }
}

- (IBAction)testSave:(id)sender {
    [self.searchTable reloadData];
}

-(void)customizeTableSettings{
    
    //Search bar Settings
    redSearchValue = [[NSUserDefaults standardUserDefaults]floatForKey:@"searchTextRed"];
    greenSearchValue = [[NSUserDefaults standardUserDefaults]floatForKey:@"searchTextGreen"];
    blueSearchValue = [[NSUserDefaults standardUserDefaults]floatForKey:@"searchTextBlue"];
    [self.searchField setTextColor:[UIColor colorWithRed:redSearchValue green:greenSearchValue blue:blueSearchValue alpha:0.8f]];
    
}
@end
