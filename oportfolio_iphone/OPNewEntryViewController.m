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
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyyMMdd'T'HH:mm:ss"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEntry:(id)sender {
    
    // SAVE TO THE CLOUD!
    
    // get the username and password TODO: check this exists and deal with that
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username"];
    NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
    
    // create the occurred_at date
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyyMMdd'T'HH:mm:ss"];
//    NSString *occurred_at = [dateFormatter stringFromDate:[NSDate date]];
    NSString *occurred_at = @"2013-01-25";
    
    // get the info from the form and store in a dictionary object
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjects:@[self.titleField.text, self.descriptionField.text, self.reflectionField.text, occurred_at] forKeys:@[@"title", @"description", @"reflection", @"occurred_at"]];
    NSLog(@"%@", dictionary);
    
    [[SBAPIManager sharedManager] setUsername:userName andPassword:password];
    [[SBAPIManager sharedManager] postPath:@"https://o-portfolio-api.herokuapp.com/entries/" parameters:dictionary success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSLog(@"saved!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"There was an error: %@", error.localizedDescription);
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
