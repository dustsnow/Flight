//
//  SearchMethodViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchMethodViewController.h"
#import "SearchByAirportViewController.h"
#import "SearchByFlightNumberViewController.h"
@interface SearchMethodViewController ()

@end

@implementation SearchMethodViewController

@synthesize searchMethods;
@synthesize searchByAirportViewController = _searchByAirportViewController;
@synthesize searchByFlightNumberViewController = _searchByFlightNumberViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Flight", @"Search Method");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    searchMethods = [[NSArray alloc] initWithObjects:@"Airport",@"Flight#", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [searchMethods count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *currentCell = [searchMethods objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentCell];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Search Flight By";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[searchMethods objectAtIndex:indexPath.row] isEqual:@"Airport"]) {
        if (!self.searchByAirportViewController) {
            self.searchByAirportViewController = [[SearchByAirportViewController alloc]
                                                  initWithNibName:@"SearchByAirportViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.searchByAirportViewController animated:YES];
    }
    if ([[searchMethods objectAtIndex:indexPath.row] isEqual:@"Flight#"]) {
        if (!self.searchByFlightNumberViewController) {
            self.searchByFlightNumberViewController = [[SearchByFlightNumberViewController alloc]
                                                       initWithNibName:@"SearchByFlightNumberViewController" bundle:nil];
        }
        [self.navigationController pushViewController:self.searchByFlightNumberViewController animated:YES];
    }
}

@end
