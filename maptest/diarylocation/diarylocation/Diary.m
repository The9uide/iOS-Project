//
//  Diary.m
//  testMapKit
//
//  Created by Trithep Ratanapipop on 12/2/2558 BE.
//  Copyright © 2558 Trithep Ratanapipop. All rights reserved.
//

#import "Diary.h"

@implementation Diary

static const NSString *kLatitude = @"latitude";
static const NSString *kLongitude = @"longitude";
static const NSString *kTitle = @"title";
static const NSString *kLocationName = @"location";
static const NSString *kImageName = @"image";

-(id)initWtithDictionary:(NSDictionary *)dict{
    self=[super init];
    if(self){
        self.latitude = dict[kLatitude];
        self.longitude = dict[kLongitude];
        self.title  = dict[kTitle];
        self.locationName = dict[kLocationName];
        self.ImageName = dict[kImageName];
        
    }
    return self;
}

-(MKPointAnnotation *)getAnnotation{
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.title = self.title;
    point.subtitle = self.locationName;
    point.coordinate = CLLocationCoordinate2DMake([self.latitude doubleValue],[self.longitude doubleValue]);
    return point;
}

@end
