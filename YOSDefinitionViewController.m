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

-(id) initWithModel:(YOSWordsModel*) pModel{
    
    if (self = [super init]){
        _model = pModel;
        
        
        [self syncModelToView];
        
    }
    return self;
}


#pragma mark - Utils

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

// La vista esta creada y ya esta lista para ser cargada
-(void) viewWillAppear:(BOOL)animated

{

    //Asignamos el delegado
    self.browser.delegate = self;
    
    [self syncModelToView];
}


-(void) viewWillDisappear:(BOOL)animated{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator hidesWhenStopped];
    self.activityIndicator.hidden = YES;
}

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


-(void) syncModelToView{
    
    NSString *word = [self.model wo]
    
    [self.browser loadRequest:[self definitionRequestForWord:<#(NSString *)#>]]
    
    
}


#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc{
    
    
    
    //¿Qué había que poner aquí?
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
    
    // ¿Y aquí?
}
@end
