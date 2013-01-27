//
//  OPLoginViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPLoginViewController.h"
#import "AFJSONRequestOperation.h"
#import "OPClientAuthentication.h"

@interface OPLoginViewController ()

@end

@implementation OPLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIAlertView *alertDialog = [[UIAlertView alloc]
                                initWithTitle:@"Login to oPortfolio"
                                message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Login", nil];
    
    alertDialog.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertDialog show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UIAlertViewDelegate

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // get the user's info for the user defaults
    NSString *userName = [alertView textFieldAtIndex:0].text;
    NSString *password = [alertView textFieldAtIndex:1].text;
    
    // make post using userName and password
    [[SBAPIManager sharedManager] setUsername:userName andPassword:password];
    [[SBAPIManager sharedManager] getPath:@"http://o-portfolio-api-2.herokuapp.com/authenticate" parameters:nil success:^(AFHTTPRequestOperation *operation, id JSON) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:userName forKey:@"username"];
            [defaults setObject:password forKey:@"password"];
            [defaults setBool:YES forKey:@"defaultUserSet"];
            [defaults synchronize];
            [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"There was an error: %@", error.localizedDescription);
    }];
}


@end
