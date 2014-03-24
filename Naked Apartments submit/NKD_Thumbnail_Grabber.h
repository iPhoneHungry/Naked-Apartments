//
//  NKD_Thumbnail_Grabber.h
//  Naked Apartments submit
//
//  Created by c on 3/21/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NKD_Thumbnail_Grabber : NSObject

@property (nonatomic, retain) UIImage *app_Thumbnail;
-(void)requestImage:(NSString *)link;
@end
