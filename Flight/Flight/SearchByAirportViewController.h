//
//  SearchByAirportViewController.h
//  Flight
//
//  Created by peng hou on 3/29/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchByAirportViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *options;

@end
