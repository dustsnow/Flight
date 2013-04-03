//
//  SearchResultTableViewCell.m
//  Flight2
//
//  Created by peng hou on 4/1/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchResultTableViewCell.h"

@implementation SearchResultTableViewCell

@synthesize flightName = _flightName;
@synthesize departsTime = _departsTime;
@synthesize departsDate = _departsDate;
@synthesize arrivesDate = _arrivesDate;
@synthesize arrivesTime = _arrivesTime;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
