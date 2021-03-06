//
//  DzyTableViewController.m
//  DzyUICells
//
//  Created by Dzy on 15/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyTableViewController.h"

#import <UITableView_FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "YYFPSLabel.h"

#import "DzyTableDefaultCell.h"
#import "IconNameMessageCell.h"
#import "NewsCell.h"
#import "HeaderNewsCell.h"
#import "WeiXinCell.h"
#import "QQMessageCell.h"
#import "StudentCell.h"
#import "GoogleShopCell.h"

@interface DzyTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic ) UITableView *tableView;
@property (nonatomic ) NSMutableArray *data;
@property (nonatomic ) NSMutableArray *cellIds;

@end

@implementation DzyTableViewController

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *idfenter = [_cellIds objectAtIndex:indexPath.row];

    if ([idfenter isEqualToString:@"default"]) {
        return [tableView fd_heightForCellWithIdentifier:DzyTableDefaultCell_id cacheByIndexPath:indexPath configuration:^(DzyTableDefaultCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"icon_name_message"]) {
        return [tableView fd_heightForCellWithIdentifier:IconNameMessageCell_id cacheByIndexPath:indexPath configuration:^(IconNameMessageCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"news"]) {
        return [tableView fd_heightForCellWithIdentifier:NewsCell_id cacheByIndexPath:indexPath configuration:^(NewsCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"header_news"]) {
        return [tableView fd_heightForCellWithIdentifier:HeaderNewsCell_id cacheByIndexPath:indexPath configuration:^(HeaderNewsCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    if ([idfenter isEqualToString:@"weixin"]) {
        return [tableView fd_heightForCellWithIdentifier:WeiXinCell_id cacheByIndexPath:indexPath configuration:^(WeiXinCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"qq"]) {
        return [tableView fd_heightForCellWithIdentifier:QQMessageCell_id cacheByIndexPath:indexPath configuration:^(QQMessageCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"student"]) {
        return [tableView fd_heightForCellWithIdentifier:StudentCell_id cacheByIndexPath:indexPath configuration:^(StudentCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    if ([idfenter isEqualToString:@"google"]) {
        return [tableView fd_heightForCellWithIdentifier:GoogleShopCell_id cacheByIndexPath:indexPath configuration:^(GoogleShopCell *cell) {
            [cell setModel:[_data objectAtIndex:indexPath.row]];
        }];
    }
    
    return 0.001;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *idfenter = [_cellIds objectAtIndex:indexPath.row];
    if ([idfenter isEqualToString:@"default"]) {
        DzyTableDefaultCell *cell = [DzyTableDefaultCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"icon_name_message"]) {
        IconNameMessageCell *cell = [IconNameMessageCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }

    if ([idfenter isEqualToString:@"news"]) {
        NewsCell *cell = [NewsCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"header_news"]) {
        HeaderNewsCell *cell = [HeaderNewsCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"weixin"]) {
        WeiXinCell *cell = [WeiXinCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"qq"]) {
        QQMessageCell *cell = [QQMessageCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"student"]) {
        StudentCell *cell = [StudentCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    if ([idfenter isEqualToString:@"google"]) {
        GoogleShopCell *cell = [GoogleShopCell cellForTableVIew:tableView];
        [cell setModel:[_data objectAtIndex:indexPath.row]];
        return cell;
    }
    
    static NSString *cell_id = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _data = [NSMutableArray arrayWithCapacity:10];
    _cellIds = [NSMutableArray arrayWithCapacity:10];
    [self createUI];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)registerCells {

    [_tableView registerClass:[DzyTableDefaultCell class] forCellReuseIdentifier:DzyTableDefaultCell_id];
    [_tableView registerClass:[IconNameMessageCell class] forCellReuseIdentifier:IconNameMessageCell_id];
    [_tableView registerClass:[NewsCell class] forCellReuseIdentifier:NewsCell_id];
    [_tableView registerClass:[HeaderNewsCell class] forCellReuseIdentifier:HeaderNewsCell_id];
    [_tableView registerClass:[WeiXinCell class] forCellReuseIdentifier:WeiXinCell_id];
    [_tableView registerClass:[QQMessageCell class] forCellReuseIdentifier:QQMessageCell_id];
    [_tableView registerClass:[StudentCell class] forCellReuseIdentifier:StudentCell_id];
    [_tableView registerClass:[GoogleShopCell class] forCellReuseIdentifier:GoogleShopCell_id];
    
    
    [_cellIds addObject:@"default"];
    [_cellIds addObject:@"icon_name_message"];
    [_cellIds addObject:@"news"];
    [_cellIds addObject:@"header_news"];
    [_cellIds addObject:@"weixin"];
    [_cellIds addObject:@"qq"];
    [_cellIds addObject:@"student"];
    [_cellIds addObject:@"google"];

    
    [_data addObject:@{@"title":@"Lina",@"message":@"you can request message,the type is always used to news can show only text "}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive",@"message":@"you can request message , news and chat list or other show user info cells you can setting defferent message show"}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive description message and you wirte some code to add the long long message",@"message":@"you can request message , news and chat list or other show user info cells you can setting defferent message show"}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive description message and you wirte some code to add the long long message",@"time":@"2017/01/03",@"state":@"Dream"}];    
    [_data addObject:@{@"name":@"Dave",@"message":@"you can request message,the type is always used to news can show only text",@"url":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954257052&di=e33d51616d4c6c47076e2e6ae76abf1c&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fgame%2F2015%2F6%2F18%2F201506182245552111c.jpg"}];
    [_data addObject:@{@"icon":@"imageUrl",@"name":@"Feln",@"message":@"Dive description message and you wirte some code to add the long long message",@"time":@"2017/01/03"}];
    [_data addObject:@{@"icon":@"imageUrl",@"name":@"AirMi",@"className":@"六年三班",@"email":@"dingz@163.com",@"schoolNum":@"年级: 09",@"classNum":@"班级: 03",@"score":@"分数: 567",@"money":@"103"}];
    [_data addObject:@{@"icon":@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1497954257052&di=e33d51616d4c6c47076e2e6ae76abf1c&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fgame%2F2015%2F6%2F18%2F201506182245552111c.jpg",@"title":@"StudyLiving",@"sub_title":@"All people will choose"}];
    
}

- (void)createUI {

    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
    });
    [self.view addSubview:_tableView];
    
    [self registerCells];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YYFPSLabel xw_addFPSLableOnWidnow];
    });
    
}

- (void)loadData {
    
    [_tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
