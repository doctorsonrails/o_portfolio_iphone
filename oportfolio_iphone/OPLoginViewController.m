//
//  OPLoginViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPLoginViewController.h"

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
	// Do any additional setup after loading the view.
    
    // when the app loads show the initial login form
    UIAlertView *alertDialog = [[UIAlertView alloc]
                                initWithTitle:@"Login to oPortfolio"
                                message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Login", nil];
    alertDialog.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    UITextField* nameField = [alertDialog textFieldAtIndex:0];
    [nameField setPlaceholder:@"Enter name"];
    
    UITextField* passwordField = [alertDialog textFieldAtIndex:1];
    [passwordField setPlaceholder:@"Enter number"];
    
    [alertDialog show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIAlertViewDelegate

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // make sure that we record that the user has logged in before
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"defaultUserSet"];
    
    // if stuff is entered into the form then transition to the entries view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
