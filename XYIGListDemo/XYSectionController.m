//
//  XYSectionController.m
//  XYIGListDemo
//
//  Created by quxiangyu on 2019/12/29.
//  Copyright © 2019 quxiangyu. All rights reserved.
//

#import "XYSectionController.h"
#import "LabelCell.h"

@implementation XYSectionItem

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

#pragma mark - IGListDiffable

- (id<NSObject>)diffIdentifier {

    return _name;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object {

    if (self == object) {
        return YES;
    } else if (_name == ((XYSectionItem *)object).name) {
        return YES;
    }
    return NO;
}

@end

@interface XYSectionController ()

@property (nonatomic, strong) XYSectionItem *model;

@end


@implementation XYSectionController

- (NSInteger)numberOfItems {

    return 1;
}

- (CGSize)sizeForItemAtIndex:(NSInteger)index {

    return CGSizeMake(self.collectionContext.containerSize.width, 55);
}

- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {

    LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:self atIndex:index];
    cell.label.text = _model.name;
    return cell;
}

- (void)didUpdateToObject:(id)object {

    _model = object;
}

@end
