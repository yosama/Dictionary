//
//  YOSWordsTableViewController.m
//  Padawans
//
//  Created by Yosnier on 16/01/15.
//  Copyright (c) 2015 yos. All rights reserved.
//

#import "YOSWordsTableViewController.h"

@interface YOSWordsTableViewController ()

@end

@implementation YOSWordsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Init

-(id) initWithModel: (YOSWordsModel *) pModel style: (UITableViewStyle) style
{
    if (self = [super initWithStyle:style]){
        
        _wordsModel = pModel;
        self.title =@"English Vocabulary";
        

    }
        return self;
}




#pragma mark - Table view data source

// Devuelvo la cantidad de secciones
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [self.wordsModel.letters count];
}


// Devuelo la cantidad de filas por secciones
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.wordsModel wordsAtIndex:section] count] ;
}

// Muestro el titulo de la seccion
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.wordsModel letterAtIndex:section];
}



// Construye la celda y la devuelve con un valor
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Capturo la palabra
    NSString* word = [self.wordsModel wordAtIndex:indexPath.row inLetterAtIndex:indexPath.section];
    
    //Reuse ID
    static NSString *cellId = @"WordsCell";
    
    // Crear una celda
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil){
        // tengo que crear la celda a pelo
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
        
    }
    
    // sincronizar modelo(personaje ) -> (vista) (celda)
    cell.textLabel.text = word;
    
    return cell;
}


#pragma mark -Action

-(void) wordsTableViewController: (YOSWordsTableViewController *) sender
                  didClickOnWord: (NSString *) aWord{
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
