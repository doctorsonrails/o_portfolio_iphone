//
//  OPEntriesViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPEntriesViewController.h"
#import "OPEntryViewController.h"

@interface OPEntriesViewController ()

@end

@implementation OPEntriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:@"showLoginVC" sender:nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"entry";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Entry %d", indexPath.row];
    cell.detailTextLabel.text = @"Tags will go here";
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"goToIndividualEntry" sender:nil];
}

#pragma mark - Segues

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goToIndividualEntry"]) {
        OPEntryViewController *entryViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        entryViewController.entry = [self.entries objectAtIndex:[indexPath row]];
    }
}

@end
