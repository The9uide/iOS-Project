#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@class Diary;

@interface DiaryLocation : NSObject

- (id)initWithDefaultData;
- (Diary *) diaryAtIndex:(NSUInteger)index;
- (NSUInteger) count;
- (NSArray *) getDiaryAnnotation;
+ (id)defaultDiary;


@end
