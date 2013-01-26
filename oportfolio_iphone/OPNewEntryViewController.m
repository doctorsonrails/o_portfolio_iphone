//
//  OPNewEntryViewController.m
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import "OPNewEntryViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEntry:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
