//
//  SearchMethodViewController.h
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchByAirportViewController;
@class SearchByFlightNumberViewController;

@interface SearchMethodViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *searchMethods;
@property (strong, nonatomic) SearchByAirportViewController *searchByAirportViewController;
@property (strong, nonatomic) SearchByFlightNumberViewController *searchByFlightNumberViewController;

@end
