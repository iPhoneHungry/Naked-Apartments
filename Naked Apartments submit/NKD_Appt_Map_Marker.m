//
//  NKD_Appt_Map_Marker.m
//  Naked Apartments submit
//
//  Created by c on 3/23/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKD_Appt_Map_Marker.h"

@interface NKD_Appt_Map_Marker ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;
@end

@implementation NKD_Appt_Map_Marker

- (id)initWithName:(NSString*)name coordinate:(CLLocationCoordinate2D)coordinate {
    if ((self = [super init])) {
        if ([name isKindOfClass:[NSString class]]) {
            self.name = name;
        } else {
            self.name = @"Unknown info";
        }
      
        self.theCoordinate = coordinate;
    }
    return self;
}

- (NSString *)title {
    return _name;
}


- (CLLocationCoordinate2D)coordinate {
    return _theCoordinate;
}



@end
