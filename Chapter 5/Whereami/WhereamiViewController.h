//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Thomas Kimura on 2013-09-22.
//  Copyright (c) 2013 Thomas Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface WhereamiViewController : UIViewController
    <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UISegmentedControl *toggle;
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;

@end
