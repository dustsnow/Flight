//
//  AirportListViewController.h
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AirportListViewController;
@protocol AirportListViewControllerDelegate <NSObject>

-(void) selectedAirport:(AirportListViewController *)viewController originalSelectedRow:(NSIndexPath *)originalSelectedRow selectedItem:(NSString *)item;

@end

@interface AirportListViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate>
@property (nonatomic, assign) id delegate;
@property (strong, nonatomic) NSArray *airportList;
@property (copy, nonatomic) NSIndexPath *originalSelectedRow;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSArray *recipes;
@end
