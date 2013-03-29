//
//  SearchMethodViewController.h
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SearchByAirportViewController;
@class SearchByFlightNumberViewController;

@interface SearchMethodViewController : UIViewController
@property (strong, nonatomic) SearchByAirportViewController *searchByAirportViewController;
@property (strong, nonatomic) SearchByFlightNumberViewController *searchByFlightNumberViewController;
- (IBAction)SearchByAirport:(id)sender;
- (IBAction)SearchByFlightNumber:(id)sender;

@end
