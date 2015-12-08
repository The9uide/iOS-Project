#import "DiaryLocation.h"
#import "Diary.h"

@implementation DiaryLocation{
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
                        @"location":@"IT@KMITL",
                        @"latitude":@"37.44451",
                        @"longitude":@"-122.163369"},
                      @{@"title":@"Eat Lunch With Friend",
                        @"location":@"IT Canteen",
                        @"latitude":@"13.731191",
                        @"longitude":@"100.782094"},
                      @{@"title":@"Wanna die",
                        @"location":@"AMC@KMITL",
                        @"latitude":@"-13.731217",
                        @"longitude":@"100.780310"},
                      @{@"title":@"Love Love",
                        @"location":@"KMITL",
                        @"latitude":@"100.778408",
                        @"longitude":@"-13.730072"},
                      @{@"title":@"Meeting friend",
                        @"location":@"Faculty of Science",
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
