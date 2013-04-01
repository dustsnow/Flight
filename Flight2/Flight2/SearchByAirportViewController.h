//
//  SearchByAirportViewController.h
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AirportListViewController.h"

@class AirportListViewController;

@interface SearchByAirportViewController : UIViewController <AirportListViewControllerDelegate>

@property (strong, nonatomic) NSURLConnection *theConnection;
@property (strong, nonatomic) AirportListViewController *airportListViewController;
@property (strong, nonatomic) NSMutableArray *options;
@property (strong, nonatomic) NSMutableArray *values;
@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;
@property (weak, nonatomic) IBOutlet UIDatePicker *flightDatePicker;

@end
