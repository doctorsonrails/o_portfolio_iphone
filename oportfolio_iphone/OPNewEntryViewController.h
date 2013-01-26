//
//  OPNewEntryViewController.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OPNewEntryViewController : UITableViewController


- (IBAction)saveEntry:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionField;
@property (strong, nonatomic) IBOutlet UITextView *reflectionField;

@end
