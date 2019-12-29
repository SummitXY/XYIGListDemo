//
//  ViewController.m
//  XYIGListDemo
//
//  Created by quxiangyu on 2019/12/29.
//  Copyright © 2019 quxiangyu. All rights reserved.
//

#import "ViewController.h"
#import <IGListKit.h>
#import "XYSectionController.h"

@interface ViewController () <IGListAdapterDataSource>

@property (nonatomic, strong) IGListAdapter *adapter;
@property (nonatomic, strong) IGListCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *demos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//    self.collectionView.frame = self.view.bounds;
//}

#pragma mark - Getter

- (IGListCollectionView *)collectionView {

    if (!_collectionView) {
        _collectionView = [[IGListCollectionView alloc] initWithFrame:self.view.bounds];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollEnabled = YES;
        _collectionView.bounces = YES;
        _collectionView.alwaysBounceVertical = YES;

    }
    return _collectionView;
}

- (IGListAdapter *)adapter {

    if (!_adapter) {
        _adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init] viewController:self];
    }
    return _adapter;
}

- (NSMutableArray *)demos {

    if (!_demos) {
        _demos = [NSMutableArray arrayWithObjects:
                  [[XYSectionItem alloc] initWithName:@"上拉加载"],
                  [[XYSectionItem alloc] initWithName:@"Search Autocomplete 搜索"],
                  [[XYSectionItem alloc] initWithName:@"混合数据"],
                  nil];
    }
    return _demos;
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {

    return self.demos;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {

    return [[XYSectionController alloc] init];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end
