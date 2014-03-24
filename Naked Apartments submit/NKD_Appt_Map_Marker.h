//
//  NKD_Appt_Map_Marker.h
//  Naked Apartments submit
//
//  Created by c on 3/23/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface NKD_Appt_Map_Marker : NSObject <MKAnnotation>

- (id)initWithName:(NSString*)name coordinate:(CLLocationCoordinate2D)coordinate;


@end
