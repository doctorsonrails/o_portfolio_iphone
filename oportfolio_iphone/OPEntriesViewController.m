//
//  OPEntriesViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPEntriesViewController.h"
#import "OPEntryViewController.h"
#import "AFJSONRequestOperation.h"
#import "OPClientAuthentication.h"

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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults boolForKey:@"defaultUserSet"])
    {
        [self performSegueWithIdentifier:@"showLoginVC" sender:nil];
    } else {
        [self getEntriesInBackground];
    }
}

- (IBAction)refreshEntries:(id)sender {
    [self getEntriesInBackground];
}

- (void) getEntriesInBackground
{
    // get the user's info for the user defaults
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    // make requests using userName and password
    [[SBAPIManager sharedManager] setUsername:userName andPassword:password];
    [[SBAPIManager sharedManager] getPath:@"http://o-portfolio-api-2.herokuapp.com/entries" parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
        self.entries = JSON;
        for (NSDictionary* entryData in self.entries) {
            Entry *entry = [[Entry alloc] init];
            entry.title = entryData[@"title"];
            entry.description = entryData[@"description"];
            entry.reflection  = entryData[@"reflection"];
        }
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"there was an error");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.entries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"entry";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.entries objectAtIndex:indexPath.row][@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Written on %@", [self.entries objectAtIndex:indexPath.row][@"occurred_at"]];
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
    } else if ([[segue identifier] isEqualToString:@"AddEntry"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        OPNewEntryViewController *controller = (OPNewEntryViewController *)navigationController.topViewController;
        controller.delegate = self;
    }
}

#pragma mark - AddItemViewControllerDelegate

- (void)addItemViewControllerDidCancel:(OPNewEntryViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController:(OPNewEntryViewController *)controller didFinishAddingItem:(Entry *)item
{
    [self dismissViewControllerAnimated:YES completion:nil];    
    [self getEntriesInBackground];
}



@end
