//
//  OPEntriesViewController.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "OPNewEntryViewController.h"
#import "MBProgressHUD.h"

@interface OPEntriesViewController : UITableViewController <AddItemViewControllerDelegate, MBProgressHUDDelegate>
{
    MBProgressHUD *HUD;
}

//@property (strong, nonatomic) Entry *entry;
@property (strong, nonatomic) NSMutableArray *entries;

- (IBAction)refreshEntries:(id)sender;

@end
