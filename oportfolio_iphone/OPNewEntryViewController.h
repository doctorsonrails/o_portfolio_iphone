//
//  OPNewEntryViewController.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

@class OPNewEntryViewController;
@class Entry;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(OPNewEntryViewController *)controller;
- (void)addItemViewController:(OPNewEntryViewController *)controller didFinishAddingItem:(Entry *)entry;

@end

#import <UIKit/UIKit.h>
#import "OPEntriesViewController.h"
#import "Entry.h"

@interface OPNewEntryViewController : UITableViewController


- (IBAction)saveEntry:(id)sender;
- (IBAction)didCancel:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *titleField;
@property (strong, nonatomic) IBOutlet UITextView *descriptionField;
@property (strong, nonatomic) IBOutlet UITextView *reflectionField;
@property (strong, nonatomic) Entry *entry;
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

@end
