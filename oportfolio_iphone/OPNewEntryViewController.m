//
//  OPNewEntryViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPNewEntryViewController.h"
#import "AFJSONRequestOperation.h"
#import "OPClientAuthentication.h"

@interface OPNewEntryViewController ()

@end

@implementation OPNewEntryViewController

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    // show the keyboard when the view loads!
    [self.titleField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)saveEntry:(id)sender {    
    // get the username and password TODO: need to check that this exists
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];

    // create a Entry object
    self.entry = [[Entry alloc] init];
    self.entry.title = self.titleField.text;
    self.entry.description = self.descriptionField.text;
    self.entry.reflection = self.reflectionField.text;
    self.entry.occuredAt = @"2013-01-27";
    
    // create a dictionary of values for pushing to the cloud
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:@[self.entry.title, self.entry.description, self.entry.reflection, self.entry.occuredAt] forKeys:@[@"title", @"description", @"reflection", @"occurred_at"]];
    // do the push (in the background)
    [[SBAPIManager sharedManager] setUsername:userName andPassword:password];
    [[SBAPIManager sharedManager] postPath:@"http://o-portfolio-api-2.herokuapp.com/entries" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSLog(@"Saved to API OK");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"There was an error: %@", error.localizedDescription);
    }];
    
    [self.delegate addItemViewController:self didFinishAddingItem:self.entry];
}

- (IBAction)didCancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

#pragma mark - TableView delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
