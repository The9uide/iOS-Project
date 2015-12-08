//
//  ViewController.m
//  testMapKit
//
//  Created by Trithep Ratanapipop on 12/1/2558 BE.
//  Copyright © 2558 Trithep Ratanapipop. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Diarylocation.h"
#import "Diary.h"


@interface ViewController () 
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *stackTableViewHeight;

@end

@implementation ViewController{
    Diarylocation *diarylocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self setupMap];
    // Do any additional setup after loading the view, typically from a nib
    
}

- (void)setupMap {
    [self.mapView addAnnotations:[diarylocation getDiaryAnnotation]];
    self.mapView.showsUserLocation = YES;
}

-(void)setupData{
    diarylocation = [Diarylocation defaultDiary];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
            pinView.animatesDrop = NO;
            pinView.canShowCallout = YES;
            pinView.calloutOffset = CGPointMake(-7, -5);
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            UIImageView *pinImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pin.png"]];
            pinImage.frame = CGRectMake(0, 0, 30, 30);
            pinImage.center = pinImage.superview.center;
            pinView.leftCalloutAccessoryView = pinImage;
        } else {
            pinView.annotation = annotation;
        }
    return pinView;
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
    NSLog(@"swipe");
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

- (IBAction)headerTableViewTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"tapped");
    [UIView animateWithDuration:0.2 animations:^ {
        self.stackTableViewHeight.constant = 300;
        [self.view layoutIfNeeded];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"diaryCell" forIndexPath:indexPath];
    [self setupCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setupCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Diary *diary = [diarylocation diaryAtIndex:indexPath.row];
    cell.textLabel.text = diary.title;
    cell.detailTextLabel.text = diary.locationName;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    [self performSegueWithIdentifier:@"showItemDetail" sender:self];
}

@end
