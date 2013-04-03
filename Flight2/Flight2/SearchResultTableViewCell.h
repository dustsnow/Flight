//
//  SearchResultTableViewCell.h
//  Flight2
//
//  Created by peng hou on 4/1/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *flightName;
@property (weak, nonatomic) IBOutlet UILabel *departsTime;
@property (weak, nonatomic) IBOutlet UILabel *arrivesTime;
@property (weak, nonatomic) IBOutlet UILabel *departsDate;
@property (weak, nonatomic) IBOutlet UILabel *arrivesDate;

@end
