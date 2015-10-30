//
//  ViewController.m
//  Navigation Exercise
//
//  Created by Unbounded on 4/1/13.
//  Copyright (c) 2013 Unbounded. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray *recipes;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    recipes = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto",@"Full Breakfast",@"Hamburger",@"Ham and Egg Sandwich", @"Creme Brulee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry",@"Instant Noodle with Egg",@"Noodle with BBQ Pork",@"Japanese Noodle with Pork",@"Green Tea",@"Thai Shrimp Cake",@"Angry Birds Cake",@"Ham and Cheese Panini", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [recipes count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}

//Code he did in class that didnt't work
/* -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"ShowSightngsDetails"])
    {
        DetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.sighting.text = [recipes objectAtIndex:[self.myTableView indexPathForSelectedRow].row];
    }
} */


 -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Makes new instance of DetailViewController
    DetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    [self.navigationController pushViewController:detailViewController animated:YES];
    detailViewController.sighting.text = [recipes objectAtIndex:indexPath.row];
}

@end
