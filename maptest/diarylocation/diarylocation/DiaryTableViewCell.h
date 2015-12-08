//
//  DiaryTableViewCell.h
//  testMapKit
//
//  Created by STUDENT on 12/3/15.
//  Copyright © 2015 Trithep Ratanapipop. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiaryTableViewCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *HeaderLabel;
@property (strong,nonatomic) IBOutlet UILabel *DetailLabel;
@property (strong,nonatomic) IBOutlet UIImageView *DiaryImageView;

@end
