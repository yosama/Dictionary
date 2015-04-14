//
//  YOSWordsTableViewController.m
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWordsTableViewController.h"
#import "YOSDefinitionViewController.h"
#import "UIViewController+Navigation.h"

@interface YOSWordsTableViewController ()

@end

@implementation YOSWordsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"English Vocabulary";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Init

-(id) initWithModel: (YOSWordsModel *) pModel style: (UITableViewStyle) style {
    
    if (self = [super initWithStyle:style]) {
        _wordsModel = pModel;
    }
    return self;
}

#pragma mark - Table view data source

// count section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.wordsModel.letters count];
}

// count row by section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.wordsModel wordsAtIndex:section] count] ;
}

// The section title
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.wordsModel letterAtIndex:section];
}

 // Build cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* word = [self.wordsModel wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];
    
    static NSString *cellId = @"WordsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    cell.textLabel.text = word;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *wordSelect = [self.wordsModel wordAtIndex:indexPath.row
                                  inLetterAtIndex:indexPath.section];
    NSLog(@"Sent %@",wordSelect);

    [self.delegate wordsTableViewController:self
                             didClickOnWord:wordSelect];
    
    YOSDefinitionViewController *definitionVC = [[YOSDefinitionViewController alloc] initWithModel:wordSelect];
    [self.navigationController pushViewController:definitionVC animated:YES];
    
}

@end
