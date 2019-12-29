//
//  XYSectionController.h
//  XYIGListDemo
//
//  Created by quxiangyu on 2019/12/29.
//  Copyright © 2019 quxiangyu. All rights reserved.
//

#import "IGListSectionController.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYSectionItem : NSObject<IGListDiffable>

@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

@interface XYSectionController : IGListSectionController

@end

NS_ASSUME_NONNULL_END
