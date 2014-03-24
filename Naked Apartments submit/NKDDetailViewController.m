//
//  NKDDetailViewController.m
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKDDetailViewController.h"
#import "NKD_Appt_Map_Marker.h"

#define METERS_PER_MILE 1609.344

@interface NKDDetailViewController (){
    NSDictionary * _itemInfoDictionary;
    NSDictionary * _itemLocationDictionary;
}
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (strong,nonatomic) NSDictionary * itemInfoDictionary;
@property (strong, nonatomic) NSDictionary * itemLocationDictionary;
- (void)configureView;
@end

@implementation NKDDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailArray:(NSArray *)newDetailArray
{
    if (_detailArray != newDetailArray) {
        _detailArray = newDetailArray;
        
        // Update the view.
        _itemInfoDictionary = [[NSDictionary alloc] initWithDictionary:[_detailArray objectAtIndex:0]];
        _itemLocationDictionary = [_detailArray objectAtIndex:1];
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
      //  [self.masterPopoverController dismissPopoverAnimated:YES];
    }
   
}



- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.itemInfoDictionary) {
        self.detailDescriptionLabel.text = [self.itemInfoDictionary valueForKey:@"info"];
        CLLocationCoordinate2D coordinate;
       
        coordinate.latitude = [[self.itemLocationDictionary valueForKey:@"latitude"] floatValue];
        coordinate.longitude = [[self.itemLocationDictionary valueForKey:@"longitude"] floatValue];
        NSLog(@"latitude is %f and longitude is %f",coordinate.latitude,coordinate.longitude);
        NKD_Appt_Map_Marker *annotation = [[NKD_Appt_Map_Marker alloc] initWithName:[self.itemInfoDictionary valueForKey:@"info"] coordinate:coordinate] ;
        [self.detail_Map_View addAnnotation:annotation];
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(coordinate, 4.0 * METERS_PER_MILE, 4.0 *METERS_PER_MILE);
        
        
        [_detail_Map_View setRegion:viewRegion animated:YES];
    
        
        //only using thumbnail if not ipad since splitview already shows image
        // though this if check should be thrown into its own method
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
        NKD_Thumbnail_Grabber *thumbNail = [self.itemInfoDictionary objectForKey:@"thumbnail"];
        if (nil != thumbNail.app_Thumbnail) {
            self.detail_ImageView.image = thumbNail.app_Thumbnail;
        }else{
            // else add some default image or send error message
        }
        }

    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
      [self.masterPopoverController presentPopoverFromBarButtonItem:self.splitViewButton permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
        CLLocationCoordinate2D zoomLocation;
        
        //some starting point in new york for empty ipad map
        zoomLocation.latitude = 40.639231;
        zoomLocation.longitude= -73.943999;
        
        
        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 4.0 * METERS_PER_MILE, 4.0 *METERS_PER_MILE);
        
        
        [_detail_Map_View setRegion:viewRegion animated:YES];
        
    }
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
   
}

#pragma mark - Split view



- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.splitViewButton = barButtonItem;
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
