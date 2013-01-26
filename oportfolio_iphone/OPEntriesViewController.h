//
//  OPEntriesViewController.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface OPEntriesViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *entries;
@property (strong, nonatomic) Entry *entry;

@end
