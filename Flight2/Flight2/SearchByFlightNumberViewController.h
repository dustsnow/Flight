//
//  SearchByFlightNumberViewController.h
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirlineListViewController;

@interface SearchByFlightNumberViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *flightNumberTextField;
@property (strong, nonatomic) AirlineListViewController *airlineListViewController;
@property (strong, nonatomic) NSMutableArray *options;
@property (strong, nonatomic) NSMutableArray *values;
@end
