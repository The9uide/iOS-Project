//
//  AddLocationViewController.m
//  testMapKit
//
//  Created by STUDENT on 12/3/15.
//  Copyright © 2015 Trithep Ratanapipop. All rights reserved.
//

#import "AddLocationViewController.h"

@interface AddLocationViewController ()

@end

@implementation AddLocationViewController

@synthesize mapView = _mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)setModeMap:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            _mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}
@end
