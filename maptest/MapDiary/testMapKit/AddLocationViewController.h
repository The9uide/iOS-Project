//
//  AddLocationViewController.h
//  testMapKit
//
//  Created by STUDENT on 12/3/15.
//  Copyright © 2015 Trithep Ratanapipop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface AddLocationViewController : UIViewController {
    MKMapView *mapview;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)setModeMap:(id)sender;




@end
