//
//  Diarylocation.h
//  testMapKit
//
//  Created by Trithep Ratanapipop on 12/1/2558 BE.
//  Copyright © 2558 Trithep Ratanapipop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class Diary;

@interface Diarylocation : NSObject

- (id)initWithDefaultData;
- (Diary *) diaryAtIndex:(NSUInteger)index;
- (NSUInteger) count;
- (NSArray *) getDiaryAnnotation;
+ (id)defaultDiary;


@end
