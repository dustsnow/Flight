//
//  SearchResultViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultTableViewCell.h"

#define flightName_TAG 1
#define flightName_TAG 1
#define departs_TAG 1
#define arrives_TAG 1
#define departsTime_TAG 1
#define arrivesTime_TAG 1
#define departsDate_TAG 1
#define arrivesDate_TAG 1

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

@synthesize searchResult;
@synthesize searchResultTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Search Result", @"Search Result");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [searchResultTableView reloadData];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [searchResult count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSArray *keys =[[NSArray alloc] initWithObjects:@"flightName",@"departsTime",@"departsDate",@"arrivesTime",@"arrivesDate", nil];
//    NSArray *values = [[NSArray alloc] initWithObjects:@"DL0451",@"6:00am",@"Apr 01, 2013",@"8:00am",@"Apr 01, 2013", nil];
//    searchResult = [[NSDictionary alloc] initWithObjects:values forKeys:keys];
    
    static NSString *cellIdentifier = @"cell";
    SearchResultTableViewCell *cell = (SearchResultTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SearchResultTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    for (NSString *eachKey in searchResult) {
        [cell.flightName setText:[searchResult[eachKey]  objectForKey:@"flightName"]];
        [cell.departsTime setText:[searchResult[eachKey] objectForKey:@"departsTime"]];
        [cell.departsDate setText:[searchResult[eachKey] objectForKey:@"departsDate"]];
        [cell.arrivesTime setText:[searchResult[eachKey] objectForKey:@"arrivesTime"]];
        [cell.arrivesDate setText:[searchResult[eachKey] objectForKey:@"arrivesDate"]];
        //NSLog(@"Object:%@",searchResult[eachKey]);
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 118;
}
@end
