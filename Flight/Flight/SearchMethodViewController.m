//
//  SearchMethodViewController.m
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchMethodViewController.h"
#import "SearchByAirportViewController.h"
#import "SearchByFlightNumberViewController.h"

@interface SearchMethodViewController ()

@end

@implementation SearchMethodViewController

@synthesize searchByAirportViewController = _searchByAirportViewController;
@synthesize searchByFlightNumberViewController = _searchByFlightNumberViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Back",@"Search Method");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SearchByAirport:(id)sender {
    //Transient to "Search By Airport View
    if(!self.searchByAirportViewController){
        self.searchByAirportViewController = [[SearchByAirportViewController alloc] initWithNibName:@"SearchByAirportViewController" bundle:nil];
    }
    [self.navigationController pushViewController:self.searchByAirportViewController animated:YES];
}

- (IBAction)SearchByFlightNumber:(id)sender {
    //Transient to "Search By Flight Number View
    if(!self.searchByFlightNumberViewController){
        self.searchByFlightNumberViewController= [[SearchByFlightNumberViewController alloc] initWithNibName:@"SearchByAirportViewController" bundle:nil];
    }
    [self.navigationController pushViewController:self.searchByFlightNumberViewController animated:YES];
}
@end
