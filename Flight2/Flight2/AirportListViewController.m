//
//  AirportListViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "AirportListViewController.h"

@interface AirportListViewController ()

@end

@implementation AirportListViewController

@synthesize airportList;
@synthesize delegate;
@synthesize originalSelectedRow;
@synthesize searchResults, recipes;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    airportList = [[NSArray alloc] initWithObjects:@"Atlanta",@"NY",@"CA",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return [airportList count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    } else {
        NSString *currentCell = [airportList objectAtIndex:indexPath.row];
        [[cell textLabel] setText:currentCell];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *returnValue = [[NSString alloc] init];
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        returnValue = [searchResults objectAtIndex:indexPath.row];
    } else {
        returnValue = [airportList objectAtIndex:indexPath.row];
    }
    [self.delegate selectedAirport:self originalSelectedRow:originalSelectedRow selectedItem:returnValue];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchText];
    
    searchResults = [airportList filteredArrayUsingPredicate:resultPredicate];
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
          scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}
@end
