//
//  INVAudioListVC.m
//  MuzOn
//
//  Created by Ivan Novikov on 11.10.15.
//  Copyright © 2015 inov. All rights reserved.
//

#import "INVAudioListVC.h"
#import "INVAudioListModel.h"
#import "INVAudioListCell.h"

@interface INVAudioListVC () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) INVAudioListModel *model;

@end

@implementation INVAudioListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[INVAudioListModel alloc] init];
    [self.model loadAudioList];
    
    [self.model addObserver:self forKeyPath:@"modelData" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    [self.tableView reloadData];
}


#pragma mark TableView Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.itemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"INVAudioListCellID";
    
    INVAudioListCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    [cell configureCellWithDictionary:self.model.modelData[indexPath.row]];
    
    return cell;
}

-(void)dealloc{
    [self.model removeObserver:self forKeyPath:@"modelData"];
}
@end
