//
//  SearchByAirportViewController.h
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AirportListViewController.h"

@class AirportListViewController;

@interface SearchByAirportViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AirportListViewControllerDelegate>

@property (strong, nonatomic) AirportListViewController *airportListViewController;
@property (strong, nonatomic) NSMutableArray *options;
@property (strong, nonatomic) NSMutableArray *values;
@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;

@end
