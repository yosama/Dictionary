//
//  YOSDefinitionViewController.m
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSDefinitionViewController.h"

@interface YOSDefinitionViewController ()

@end

@implementation YOSDefinitionViewController



#pragma mark - Init


-(id) initWithModel:(NSString *) aModel {
    
    if (self = [super init]) {
        
        _model = aModel;
        
    }
    return self;
}



#pragma mark - Utils


- (void)viewDidLoad {
    
    [super viewDidLoad];

}


// La vista esta creada y ya esta lista para ser cargada
-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    //Assign delegate
    self.browser.delegate = self;
    [self syncModelToView];
    
}



//-(void) viewWillDisappear:(BOOL)animated {
//    
//    [super viewWillDisappear:YES];
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Utils

-(NSURLRequest *) definitionRequestForWord: (NSString *) aWord{
    
    
    NSURL *url = [NSURL URLWithString:
                  [NSString stringWithFormat:@"http://www.merriam-webster.com/dictionary/%@", aWord]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    return request;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */



-(void) syncModelToView {
    
    self.title = self.model;
    
    [self.browser loadRequest:[self definitionRequestForWord:self.model]];
    
}


#pragma mark - UISplitViewControllerDelegate


-(void) splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
}


-(void) splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    self.navigationItem.leftBarButtonItem = nil;
    
}



#pragma mark - YOSWordsTableViewControllerDelegate


-(void) wordsTableViewController: (YOSWordsTableViewController *) sender didClickOnWord: (NSString *) aWord {
    
    self.model = aWord;
        
    NSLog(@" Receive %@",self.model);
    
    [self.activityIndicator startAnimating];
    
    [self syncModelToView];
    
    
}



#pragma mark - UIWebviewDelegate 


-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator hidesWhenStopped];
    self.activityIndicator.hidden = YES;
}





















@end
