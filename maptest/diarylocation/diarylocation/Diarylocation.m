//
//  Diarylocation.m
//  testMapKit
//
//  Created by Trithep Ratanapipop on 12/1/2558 BE.
//  Copyright © 2558 Trithep Ratanapipop. All rights reserved.
//

#import "Diarylocation.h"
#import "Diary.h"

@implementation Diarylocation{
    NSArray *diaryAnnotation;
    NSArray *diaryLists;
}

- (id)initWithDefaultData;{
    self = [super init];
    if (self) {
        [self setupData];
    }
    return self;
}

- (Diary *) diaryAtIndex:(NSUInteger)index{
    return diaryLists[index];
}

- (NSUInteger) count{
    return diaryLists.count;
}

- (void) setupData{
    NSArray *list = @[@{@"title":@"Final Exam!",
                        @"image":@"1.png",
                        @"location":@"IT@KMITL",
                        @"latitude":@"37.44451",
                        @"longitude":@"-122.163369"},
                      @{@"title":@"Eat Lunch With Friend",
                        @"image":@"2.png",
                        @"location":@"IT Canteen",
                        @"latitude":@"13.731191",
                        @"longitude":@"100.782094"},
                      @{@"title":@"Wanna die",
                        @"image":@"3.png",
                        @"location":@"AMC@KMITL",
                        @"latitude":@"-13.731217",
                        @"longitude":@"100.780310"},
                      @{@"title":@"Love Love",
                        @"image":@"1.png",
                        @"location":@"KMITL",
                        @"latitude":@"37.778408",
                        @"longitude":@"-112.730072"},
                      @{@"title":@"Love Love Love Love Love Love Love Love Love Love Love Love Love Love Love Love",
                        @"image":@"2.png",
                        @"location":@"KMITL",
                        @"latitude":@"100.778408",
                        @"longitude":@"-13.730072"},
                      @{@"title":@"Meeting friend",
                        @"image":@"3.png",
                        @"location":@"Faculty of Science Faculty of Science Faculty of Science Faculty of Science Faculty of Science ",
                        @"latitude":@"37.44451",
                        @"longitude":@"-122.163369"}
                      ];
    NSMutableArray *tmp = [NSMutableArray array];
    for (NSDictionary *dict in list) {
        [tmp addObject:[[Diary alloc] initWtithDictionary:dict]];
    }
    diaryLists = [NSArray arrayWithArray:tmp];
    
}

- (NSArray *) getDiaryAnnotation{
    NSMutableArray *AnnotationTmp = [NSMutableArray array];
    for (Diary *diaryTmp in diaryLists){
        [AnnotationTmp addObject:[diaryTmp getAnnotation]];
    }
    diaryAnnotation = [NSArray arrayWithArray:AnnotationTmp];
    return diaryAnnotation;
}

+(id)defaultDiary{
    return [[[self class]alloc] initWithDefaultData];
}

@end
