//
//  NKDDetailViewController.h
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "NKD_Thumbnail_Grabber.h"

@interface NKDDetailViewController : UIViewController <UISplitViewControllerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic,strong) NSArray *detailArray;

@property (weak, nonatomic) IBOutlet UIImageView *detail_ImageView;

@property (weak, nonatomic) IBOutlet MKMapView *detail_Map_View;

@property (strong,nonatomic) UIBarButtonItem *splitViewButton;

@property (strong,nonatomic) NKD_Thumbnail_Grabber *detail_ThumbData;
@end
