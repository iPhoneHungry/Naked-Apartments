//
//  NKDMasterViewController.m
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKDMasterViewController.h"
#import "NKDDetailViewController.h"
#import "NKD_Html_Element.h"
#import "NKD_Custom_Cell.h"
#import "NKD_Thumbnail_Grabber.h"

#define this_Views_Title @"Naked Apartments"

@interface NKDMasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@implementation NKDMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
    
 
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.detailViewController = (NKDDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];    nakedParser = [[NKD_Html_Parse alloc] init];
    if (nil == self.apartmentRequestURL) {
        self.apartmentRequestURL = @"http://www.nakedapartments.com/renter/listings/search?order=asc&sort=rent&page=1";
    }
    
    [nakedParser loadHtmlByURL:self.apartmentRequestURL];
    self.title = this_Views_Title;
    
 // this was  a temp test to check data before calling reload...change to nsnotification
    #warning dear me, change to nsnotification for table reloading
    NSTimer *naked_Timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nkdReloadTable) userInfo:Nil repeats:YES];
    
   [naked_Timer fire];
}

- (void)nkdReloadTable{
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (nakedParser) {
        int rowCount = (int)[[nakedParser allItemsFound] count];
       NSLog(@"row count is %i", rowCount);
        
        return rowCount;
        
    } else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomNakedCell";
    
    NKD_Custom_Cell *cell = (NKD_Custom_Cell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Custom_Naked_Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell.
    NSMutableDictionary *currentElement = [[nakedParser allItemsFound] objectAtIndex:indexPath.row];
  //  NSLog(@"%@",currentElement);
    cell.app_Info_Label.text = [currentElement objectForKey:@"info"];
   // NSLog(@"text is %@ ",[currentElement objectForKey:@"info"]);
    NKD_Thumbnail_Grabber *thumbNail = [currentElement objectForKey:@"thumbnail"];
    if (nil != thumbNail.app_Thumbnail) {
        cell.app_Image_View.image = thumbNail.app_Thumbnail;
    }else{
     // else add some default image or send error message
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
       
   
            }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDictionary *currentElement = [[nakedParser allItemsFound] objectAtIndex:indexPath.row];
        NSDictionary *geoElement = [[nakedParser allItemsFound_Geo] objectAtIndex:indexPath.row];
        NSArray *passingObject = [NSArray arrayWithObjects:currentElement,geoElement, nil];
        [self.detailViewController setDetailArray:passingObject];
        NSLog(@"ipad detail set");
    } else {
        [self performSegueWithIdentifier:@"apptDetail" sender:self];
    }
    
    NSLog(@"a cell was selected");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"apptDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
         NSDictionary *currentElement = [[nakedParser allItemsFound] objectAtIndex:indexPath.row];
        NSDictionary *geoElement = [[nakedParser allItemsFound_Geo] objectAtIndex:indexPath.row];
        NSArray *passingObject = [NSArray arrayWithObjects:currentElement,geoElement, nil];
             [[segue destinationViewController] setDetailArray:passingObject];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

#pragma mark - Fetched results controller


- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
     }

@end
