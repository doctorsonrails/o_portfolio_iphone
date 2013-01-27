//
//  OPSettingsViewController.m
//  oportfolio
//
//  Created by Edward Wallitt on 27/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPSettingsViewController.h"
#import "OPLoginViewController.h"

@interface OPSettingsViewController ()

@end

@implementation OPSettingsViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)didpresssLogoutButton:(id)sender {
    
    // remove the userdefault boolean
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"defaultUserSet"];
    // transition back to start of the app
    [self performSegueWithIdentifier:@"goToLoginView" sender:nil];
}
@end
