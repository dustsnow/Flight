//
//  SearchByAirportViewController.m
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchByAirportViewController.h"
#import "AirportListViewController.h"

@interface SearchByAirportViewController ()

@end

@implementation SearchByAirportViewController

@synthesize options;
@synthesize values;
@synthesize airportListViewController;

-(void)addItemViewController:(AirportListViewController *)controller originalRow:(NSIndexPath *)originalIndexPath didFinishEnteringItem:(NSString *)item{
    //[NSLog(@"This was returned %@",item)];
    [values replaceObjectAtIndex:originalIndexPath.row withObject:item];
    [self.optionsTableView reloadData];
    //[self.optionsTableView beginUpdates];
    //[self.optionsTableView reloadRowsAtIndexPaths:[[NSArray alloc] initWithObjects:selectedIndexPath, nil]
    //                       withRowAnimation:UITableViewRowAnimationAutomatic];
    //[self.optionsTableView endUpdates];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:@"cell"];
    }
    NSString *currentCell = [options objectAtIndex:indexPath.row];
    NSString *currentValue = [values objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentCell];
    [[cell detailTextLabel] setText:currentValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != 2) {
        if(!self.airportListViewController ){
            self.airportListViewController = [[AirportListViewController alloc] initWithNibName:@"AirportListViewController" bundle:nil];
        }
        self.airportListViewController.originalIndexPath = indexPath;
        self.airportListViewController.delegate = self;
        [self.navigationController pushViewController:self.airportListViewController animated:YES];
    }
    

    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Airport",@"Search Method");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    options = [[NSMutableArray alloc] initWithObjects:@"Departure",@"Arrival",@"Date", nil];
    values = [[NSMutableArray alloc] initWithObjects:@"Atlanta",@"NY",@"2013-3-1",nil];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setOptionsTableView:nil];
    [super viewDidUnload];
}
@end
