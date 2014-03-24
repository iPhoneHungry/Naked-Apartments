//
//  NKD_Custom_Cell.h
//  Naked Apartments submit
//
//  Created by c on 3/21/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NKD_Custom_Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *app_Info_Label;
@property (strong, nonatomic) IBOutlet UIImageView *app_Image_View;

@property (strong,nonatomic) NSString *apparmentURL;


@end
