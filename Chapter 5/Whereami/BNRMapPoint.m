//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Thomas Kimura on 2013-10-03.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@ synthesize title, coordinate, subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c
                  title:(NSString *)t
               subtitle:(NSString *)d
{
    self = [super init];
    if (self) {
        coordinate = c;
        subtitle = d;
        [self setTitle:t];
    }
    return self;
}

-(id)init
{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown" subtitle:@"now"];
}

@end
