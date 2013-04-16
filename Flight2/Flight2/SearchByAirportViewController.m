//
//  SearchByAirportViewController.m
//  Flight2
//
//  Created by peng hou on 3/31/13.
//  Copyright (c) 2013 Peng Hou. All rights reserved.
//

#import "SearchByAirportViewController.h"
#import "AirportListViewController.h"
#import "SearchResultViewController.h"

@interface SearchByAirportViewController ()

@end

@implementation SearchByAirportViewController

@synthesize options, values;
@synthesize airportListViewController = _airportListViewController;
@synthesize theConnection;
@synthesize searchResultViewController = _searchResultViewController;

//Delegate of AirportListViewController
-(void) selectedAirport:(AirportListViewController *)viewController originalSelectedRow:(NSIndexPath *)originalSelectedRow selectedItem:(NSString *)item{
    [values replaceObjectAtIndex:originalSelectedRow.row withObject:item];
    [self.optionsTableView reloadData];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Airport", @"Search");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Initialize options
    options = [[NSMutableArray alloc] initWithObjects:@"Departure",@"Arrival",@"Date", nil];
    
    //Get today's date
    NSDate *todayDate = [[NSDate alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    NSString *today = [formatter stringFromDate:todayDate];
    
    //set content of values
    values = [[NSMutableArray alloc] initWithObjects:@"Atlanta",@"NY",today,nil];
    
    //Add search button on the right corner
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonPressed:)];
    self.navigationItem.rightBarButtonItem = searchButton;
    
    //Hidden date picker
    [self.flightDatePicker setHidden:YES];
    
    //Set DatePicker to only display date
    [self.flightDatePicker setDatePickerMode:UIDatePickerModeDate];
    
    //Constraining the range of date
    [self.flightDatePicker setMinimumDate:todayDate];
    NSTimeInterval oneDayInSeconds = 60*60*24;
    NSDate *tomorrowDate = [[NSDate alloc] initWithTimeIntervalSinceNow:oneDayInSeconds];
    [self.flightDatePicker setMaximumDate:tomorrowDate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [options count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSString *currentCell = [options objectAtIndex:indexPath.row];
    NSString *currentValue = [values objectAtIndex:indexPath.row];
    [[cell textLabel] setText:currentCell];
    [[cell detailTextLabel] setText:currentValue];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (![[options objectAtIndex:indexPath.row] isEqual:@"Date"]) {
        if (!self.airportListViewController) {
            self.airportListViewController = [[AirportListViewController alloc]
                                              initWithNibName:@"AirportListViewController"bundle:nil];
        }
        if ([[options objectAtIndex:indexPath.row] isEqual:@"Departure"]) {
            self.airportListViewController.title = NSLocalizedString(@"Departure", @"Departure");
        }
        if ([[options objectAtIndex:indexPath.row] isEqual:@"Arrival"]) {
            self.airportListViewController.title = NSLocalizedString(@"Arrival", @"Arrival");
        }
        self.airportListViewController.originalSelectedRow = indexPath;
        self.airportListViewController.delegate = self;
        [self.navigationController pushViewController:self.airportListViewController animated:YES];
    }
    if ([[options objectAtIndex:indexPath.row] isEqual:@"Date"]) {
        [self.flightDatePicker setHidden:NO];
        [self.flightDatePicker addTarget:self action:@selector(pickerChanged:) forControlEvents:UIControlEventValueChanged];
    }
}
-(void) pickerChanged:(id)sender{
    NSDate *selectedDate = [self.flightDatePicker date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    NSString *flightDate = [formatter stringFromDate:selectedDate];
    [values replaceObjectAtIndex:2 withObject:flightDate];
    [self.optionsTableView reloadData];
}

-(void) searchButtonPressed:(id)sender{
    NSLog(@"Search Button Pressed");
    NSString *url = @"http://www.penghou.net/file/sample.json";
	
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
											  cachePolicy:NSURLRequestUseProtocolCachePolicy
										  timeoutInterval:60.0];
	
	theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"Connection didReceiveData of length: %u", data.length);
    NSError *jsonParsingError = nil;
    NSDictionary *searchResult = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonParsingError];
    NSDictionary *address = [searchResult objectForKey:@"address"];
//    NSDictionary *dd = [searchResult objectForKey:@"phoneNumbers"];
    if (!self.searchResultViewController) {
        self.searchResultViewController = [[SearchResultViewController alloc]
                                           initWithNibName:@"SearchResultViewController" bundle:nil];
    }
    self.searchResultViewController.searchResult = searchResult;
    [self.navigationController pushViewController:self.searchResultViewController animated:YES];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"Connection didReceiveResponse: %@ - %@", response, [response MIMEType]);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
}

@end
