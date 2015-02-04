//
//  YOSDefinitionViewController.h
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#define WORD_DID_CHANGE_CHANGE_NOTIFICATION_NAME

#import <UIKit/UIKit.h>
#import "YOSWordsModel.h"


@interface YOSDefinitionViewController : UIViewController

@property (strong,nonatomic) YOSWordsModel *model;
@property (weak,nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;


// Designated

-(id) initWithModel:(YOSWordsModel*) pModel;

@end
