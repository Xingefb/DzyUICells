//
//  DzyTableViewController.m
//  DzyUICells
//
//  Created by Dzy on 15/05/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

#import "DzyTableViewController.h"

#import "DzyTableDefaultCell.h"
#import <UITableView_FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>

@interface DzyTableViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic ) UITableView *tableView;
@property (nonatomic ) NSMutableArray *data;

@end

@implementation DzyTableViewController

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:DzyTableDefaultCell_id cacheByIndexPath:indexPath configuration:^(DzyTableDefaultCell *cell) {
        [cell setModel:[_data objectAtIndex:indexPath.row]];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _data.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    DzyTableDefaultCell *cell = [DzyTableDefaultCell cellForTableVIew:tableView];
    [cell setModel:[_data objectAtIndex:indexPath.row]];
    return cell;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _data = [NSMutableArray arrayWithCapacity:10];

    [self createUI];
    [self loadData];
    // Do any additional setup after loading the view.
}


- (void)registerCells {

    [_tableView registerClass:[DzyTableDefaultCell class] forCellReuseIdentifier:DzyTableDefaultCell_id];
    [_data addObject:@{@"title":@"Dive",@"message":@"you can request message "}];
    [_data addObject:@{@"title":@"Lina",@"message":@"you can request message,you can request message,you can request message,you can request message,you can request message,you can request message,you can request message,you can request message,you can request message, "}];
    
    
    
    
}

- (void)createUI {

    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
