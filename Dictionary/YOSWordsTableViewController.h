//
//  YOSWordsTableViewController.h
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//
@import UIKit;
#import "YOSWordsModel.h"


@class YOSWordsTableViewController;

// protocolo de delegado que ha de implementar DefinitonViewController
@protocol YOSWordsTableViewControllerDelegate

-(void) wordsTableViewController: (YOSWordsTableViewController *) sender didClickOnWord: (NSString *) aWord;

@end



@interface YOSWordsTableViewController : UITableViewController

@property (strong) YOSWordsModel* wordsModel;

// Las propiedades de delegate son siempre weak
@property (weak) id<YOSWordsTableViewControllerDelegate> delegate;

-(id) initWithModel: (YOSWordsModel *) pModel style: (UITableViewStyle) style;


@end


