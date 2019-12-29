//
//  LabelCell.m
//  XYIGListDemo
//
//  Created by quxiangyu on 2019/12/29.
//  Copyright © 2019 quxiangyu. All rights reserved.
//

#import "LabelCell.h"

static CGFloat const separatorHeight = 0.5;

@interface LabelCell ()

@property (nonatomic, strong) CALayer *separator;

@end

@implementation LabelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.label];
        [self.contentView.layer addSublayer:self.separator];
    }
    return self;
}

#pragma mark - Getter

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.font = [LabelCell font];
        _label.numberOfLines = 1;
    }
    return _label;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1].CGColor;
    }
    return _separator;
}

#pragma mark - Private

- (void)layoutSubviews {

    CGRect bounds = self.contentView.bounds;
    _label.frame = UIEdgeInsetsInsetRect(bounds, [LabelCell insets]);
    CGFloat height = bounds.size.height;
    _separator.frame = CGRectMake([LabelCell insets].left, height-separatorHeight, _label.frame.size.width, separatorHeight);
}

+ (UIFont *)font {

    return [UIFont systemFontOfSize:17.0];
}

+ (UIEdgeInsets)insets {

    return UIEdgeInsetsMake(8, 15, 8, 15);
}

@end
