//
//  SearchResultViewController.h
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController

@property (copy, nonatomic) NSDictionary *searchResult;
@property (weak, nonatomic) IBOutlet UITableView *searchResultTableView;

@end
