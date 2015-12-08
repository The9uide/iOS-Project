//
//  Diary.h
//  testMapKit
//
//  Created by Trithep Ratanapipop on 12/2/2558 BE.
//  Copyright © 2558 Trithep Ratanapipop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Diary : NSObject

@property (strong,nonatomic) NSString *latitude;
@property (strong,nonatomic) NSString *longitude;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *locationName;
@property (strong,nonatomic) NSString *ImageName;


-(id)initWtithDictionary:(NSDictionary *)dict;
-(MKPointAnnotation *)getAnnotation;

@end
