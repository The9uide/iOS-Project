//
//  DiaryTableViewController.m
//  testMapKit
//
//  Created by STUDENT on 12/3/15.
//  Copyright © 2015 Trithep Ratanapipop. All rights reserved.
//

#import "DiaryTableViewController.h"
#import "DiaryTableViewCell.h"
#import "DetailViewController.h"
#import "Diarylocation.h"
#import "Diary.h"

@interface DiaryTableViewController ()

@end

@implementation DiaryTableViewController{
    Diarylocation *diarylocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupData{
    diarylocation = [Diarylocation defaultDiary];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [diarylocation count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"diaryCell" forIndexPath:indexPath];
    [self setupCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setupCell:(DiaryTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Diary *diary = [diarylocation diaryAtIndex:indexPath.row];
    cell.HeaderLabel.text = diary.title;
    cell.DetailLabel.text = diary.locationName;
    cell.DiaryImageView.image = [UIImage imageNamed:diary.ImageName];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showItemDetail"]) {
        DetailViewController *viewController = segue.destinationViewController;
        NSUInteger selectItemIndex = [self.tableView indexPathForSelectedRow].row;
        Diary *diary = [diarylocation diaryAtIndex:selectItemIndex];
        viewController.diaryItem = diary;
    }
    
}

@end
