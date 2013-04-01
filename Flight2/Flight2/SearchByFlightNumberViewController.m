//
//  SearchByFlightNumberViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchByFlightNumberViewController.h"
#import "AirlineListViewController.h"

@interface SearchByFlightNumberViewController ()

@end

@implementation SearchByFlightNumberViewController

@synthesize options, values;
@synthesize airlineListViewController = _airlineListViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Flight#",@"Search Method");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    options = [[NSMutableArray alloc] initWithObjects:@"Airline",@"Flight#",@"Date", nil];
    values = [[NSMutableArray alloc] initWithObjects:@"DELTA",@"111111",@"2013-3-1",nil];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    self.navigationItem.rightBarButtonItem = searchButton;
    [self.flightNumberTextField setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [options count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSString *currentCell = [options objectAtIndex:indexPath.row];
    NSString *currentValue = [values objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentCell];
    [[cell detailTextLabel] setText:currentValue];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[options objectAtIndex:indexPath.row] isEqual:@"Airline"]) {
        if (!self.airlineListViewController) {
            self.airlineListViewController = [[AirlineListViewController alloc]
                                              initWithNibName:@"AirlineListViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.airlineListViewController animated:YES];
    }
    if ([[options objectAtIndex:indexPath.row] isEqual:@"Flight#"]) {
        [self.flightNumberTextField setHidden:NO];
    }
}
@end
