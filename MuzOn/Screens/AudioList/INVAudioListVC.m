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
#import "INVAudioSingleVC.h"
#import "INVAudioSingleModel.h"

#import "INVAudioService.h"
#import <AVFoundation/AVFoundation.h>

@interface INVAudioListVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong, nonatomic) INVAudioListModel *model;

@end

@implementation INVAudioListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.model = [[INVAudioListModel alloc] init];
    [self loadAudios];
    
    [self.model addObserver:self forKeyPath:@"modelData" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)loadAudios{
    switch (self.loadingType) {
        case LoadingTypeFromDB:
            [self.model loadAudioFromDB];
            break;
            
        case LoadingTypeFromServer:
            [self.model loadAudioFromServer];
            break;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"modelData"]) {
        [self.tableView reloadData];
    }
}


#pragma mark TableView Delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.itemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    INVAudioListCell *cell = [tableView dequeueReusableCellWithIdentifier:INVAudioListCellCellID];
    
    [cell configureCellWithModel:self.model.modelData[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    INVAudioListCellModel *cellModel = (INVAudioListCellModel *) self.model.modelData[indexPath.row];

    [AudioService playSoundWithUrl:cellModel.urlAudio];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ( ![segue.destinationViewController isKindOfClass:[INVAudioSingleVC class]] )
        return;
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    INVAudioSingleModel *model = [[INVAudioSingleModel alloc] initWithAVAudioCellModel:self.model.modelData[indexPath.row]];
    
    INVAudioSingleVC *vc = segue.destinationViewController;
    vc.model = model;
}

-(void)dealloc{
    [self.model removeObserver:self forKeyPath:@"modelData"];
}
@end
