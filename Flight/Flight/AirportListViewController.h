//
//  AirportListViewController.h
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AirportListViewController;

@protocol AirportListViewControllerDelegate <NSObject>
- (void) addItemViewController:(AirportListViewController *)controller originalRow:(NSIndexPath *)originalIndexPath didFinishEnteringItem:(NSString *)item;
@end

@interface AirportListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) id delegate;
@property (strong, nonatomic) NSArray *airportList;
@property (copy, nonatomic) NSIndexPath *originalIndexPath;
@end
