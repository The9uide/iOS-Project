#import "ViewController.h"
#import "DiaryLocation.h"
#import "Diary.h"

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stackTableViewHeight;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController{
    DiaryLocation *diarylocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupMap];
    //test Parse
    
//    PFObject *dailyDetails = [PFObject objectWithClassName:@"DailyDetails"];
//    PFGeoPoint *point = [PFGeoPoint geoPointWithLatitude:40.0 longitude:-30.0];
//    NSDate *date = [NSDate date];
//    dailyDetails[@"tile"] = @"Test";
//    dailyDetails[@"details"] = @"Developing iOS App";
//    dailyDetails[@"time"] = date;
//    dailyDetails[@"location"] = point;
//    [dailyDetails pinInBackground];
}

- (void)setupMap {
    [self.mapView addAnnotations:[diarylocation getDiaryAnnotation]];
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager requestAlwaysAuthorization];
    
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        
        [self.locationManager startUpdatingLocation];
        self.mapView.showsUserLocation = YES;
    }
}

-(void)setupData{
    diarylocation = [DiaryLocation defaultDiary];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
    NSLog(@"USER!!");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
//    self.locations = locations.lastObject;
     NSLog(@"%@", [locations lastObject]);
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
//     If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
//     Handle any custom annotations.
    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
            pinView.animatesDrop = NO;
            pinView.canShowCallout = YES;
            pinView.calloutOffset = CGPointMake(-7, -5);
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            UIImageView *pinImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"book-bookmark-icon.png"]];
            pinImage.frame = CGRectMake(0, 0, 30, 30);
            pinImage.center = pinImage.superview.center;
            pinView.leftCalloutAccessoryView = pinImage;
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    NSLog(@"haha");
    //    if ([annotation isKindOfClass:[MKPointAnnotation class]])
    //    {
    //        // Try to dequeue an existing pin view first.
    //        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
    //        if (!pinView)
    //        {
    //            // If an existing pin view was not available, create one.
    //            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
    //            //pinView.animatesDrop = YES;
    //            pinView.canShowCallout = YES;
    //            pinView.image = [UIImage imageNamed:@"pin.png"];
    //            pinView.calloutOffset = CGPointMake(15, 5);
    //        } else {
    //            pinView.annotation = annotation;
    //        }
    //        return pinView;
    //    }
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [diarylocation count];
}
- (IBAction)swipeDownTableView:(UISwipeGestureRecognizer *)sender {
    if(sender.direction == UISwipeGestureRecognizerDirectionDown){
        [UIView animateWithDuration:0.2 animations:^ {
            self.stackTableViewHeight.constant = 40;
            [self.view layoutIfNeeded];
        }];
        sender.direction = UISwipeGestureRecognizerDirectionUp;
    }else if(sender.direction == UISwipeGestureRecognizerDirectionUp){
        [UIView animateWithDuration:0.2 animations:^ {
            self.stackTableViewHeight.constant = 300;
            [self.view layoutIfNeeded];
        }];
        sender.direction = UISwipeGestureRecognizerDirectionDown;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"diaryCell" forIndexPath:indexPath];
    [self setupCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Diary *diary = [diarylocation diaryAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"book-bookmark-icon.png"];
    cell.textLabel.text = diary.title;
    cell.detailTextLabel.text = diary.locationName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (BOOL)textFieldShouldReturn:(UIView *)viewUI {
//    if(viewUI == self.viewUI) {
//        [viewUI resignFirstResponder];
//    }
//    [viewUI resignFirstResponder];
//    return YES;
//}

@end
