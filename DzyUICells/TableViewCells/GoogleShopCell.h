//
//  GoogleShopCell.h
//  DzyUICells
//
//  Created by Dzy on 07/07/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import <UIKit/UIKit.h>


static NSString *GoogleShopCell_id = @"GoogleShopCell";

@interface GoogleShopCell : UITableViewCell

@property (nonatomic ) NSDictionary *model;
+ (instancetype)cellForTableVIew:(UITableView *)tableView;

@end
