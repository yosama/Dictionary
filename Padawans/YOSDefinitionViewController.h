//
//  YOSDefinitionViewController.h
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#define WORD_DID_CHANGE_CHANGE_NOTIFICATION_NAME

@import UIKit;
#import "YOSWordsModel.h"
#import "YOSWordsTableViewController.h"


@interface YOSDefinitionViewController : UIViewController<YOSWordsTableViewControllerDelegate, UISplitViewControllerDelegate, UIWebViewDelegate>

@property (copy) NSString *model;
@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


// Designated

-(id) initWithModel:(NSString *) aModel;

@end
