//
//  DzyTableViewController.m
//  DzyUICells
//
//  Created by Dzy on 15/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyTableViewController.h"

#import <UITableView_FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

#import "DzyTableDefaultCell.h"
#import "IconNameMessageCell.h"
#import "NewsCell.h"
#import "HeaderNewsCell.h"

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
    
    return nil;
    
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

    [_cellIds addObject:@"default"];
    [_cellIds addObject:@"icon_name_message"];
    [_cellIds addObject:@"news"];
    [_cellIds addObject:@"header_news"];
    
    [_tableView registerClass:[DzyTableDefaultCell class] forCellReuseIdentifier:DzyTableDefaultCell_id];
    [_tableView registerClass:[IconNameMessageCell class] forCellReuseIdentifier:IconNameMessageCell_id];
    [_tableView registerClass:[NewsCell class] forCellReuseIdentifier:NewsCell_id];
    [_tableView registerClass:[HeaderNewsCell class] forCellReuseIdentifier:HeaderNewsCell_id];

    
    [_data addObject:@{@"title":@"Lina",@"message":@"you can request message,the type is always used to news can show only text "}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive",@"message":@"you can request message , news and chat list or other show user info cells you can setting defferent message show"}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive description message and you wirte some code to add the long long message",@"message":@"you can request message , news and chat list or other show user info cells you can setting defferent message show"}];
    [_data addObject:@{@"icon":@"imageUrl",@"title":@"Dive description message and you wirte some code to add the long long message",@"time":@"2017/01/03",@"state":@"Dream"}];

    
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
