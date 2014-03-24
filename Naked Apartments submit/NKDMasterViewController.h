//
//  NKDMasterViewController.h
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NKDDetailViewController;


#import "NKD_Html_Parse.h"

@interface NKDMasterViewController : UITableViewController {
    
    NKD_Html_Parse *nakedParser;
    
    
}
@property (strong,nonatomic) NSString *apartmentRequestURL;
@property (strong, nonatomic) NKDDetailViewController *detailViewController;


@end
