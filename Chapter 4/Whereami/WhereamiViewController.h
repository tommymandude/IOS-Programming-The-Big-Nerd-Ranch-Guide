//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Thomas Kimura on 2013-09-22.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}



@end
