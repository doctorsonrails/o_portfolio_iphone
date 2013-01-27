//
//  OPEntryViewController.h
//  oportfolio_iphone
//
//  Created by Edward Wallitt on 26/01/2013.
//  Copyright (c) 2013 Edward Wallitt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface OPEntryViewController : UIViewController

@property (strong, nonatomic) NSString *entryTitle;
@property (strong, nonatomic) NSString *entryDescription;
@property (strong, nonatomic) NSString *entryReflection;

@property (strong, nonatomic) IBOutlet UITextView *descriptionArea;
@property (strong, nonatomic) IBOutlet UITextView *reflectionArea;

@end
