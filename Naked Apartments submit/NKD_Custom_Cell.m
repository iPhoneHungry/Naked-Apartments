//
//  NKD_Custom_Cell.m
//  Naked Apartments submit
//
//  Created by c on 3/21/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKD_Custom_Cell.h"

@implementation NKD_Custom_Cell{
    NSMutableData *_image_URL_Data;
    NSURLConnection  *_nakedURL_Connection;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
