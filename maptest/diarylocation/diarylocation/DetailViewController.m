//
//  DetailViewController.m
//  testMapKit
//
//  Created by STUDENT on 12/3/15.
//  Copyright © 2015 Trithep Ratanapipop. All rights reserved.
//

#import "DetailViewController.h"
#import "Diary.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    // Do any additional setup after loading the view.
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData{
    self.title = self.diaryItem.title;
    self.detailImageView.image = [UIImage imageNamed:[self.diaryItem ImageName]];
    self.titleLabel.text = self.diaryItem.title;
    self.detailLabel.text = self.diaryItem.locationName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
