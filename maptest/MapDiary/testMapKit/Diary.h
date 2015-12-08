#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Diary : NSObject

@property (strong,nonatomic) NSString *latitude;
@property (strong,nonatomic) NSString *longitude;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *locationName;


-(id)initWtithDictionary:(NSDictionary *)dict;
-(MKPointAnnotation *)getAnnotation;

@end
