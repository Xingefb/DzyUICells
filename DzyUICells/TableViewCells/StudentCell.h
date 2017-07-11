//
//  StudentCell.h
//  DzyUICells
//
//  Created by Dzy on 22/06/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *StudentCell_id = @"StudentCell";


@interface StudentCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;


@end
