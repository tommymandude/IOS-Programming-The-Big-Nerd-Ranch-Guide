//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Thomas Kimura on 2013-10-03.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>
{
    
}

//designated initilizer for instances of bnrmappoint
- (id)initWithCoordinate:(CLLocationCoordinate2D)c
                   title:(NSString *)t
                    subtitle:(NSString *)d;

//required property from mkanotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

//optional property
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;

@end


