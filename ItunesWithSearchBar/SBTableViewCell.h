//
//  SBTableViewCell.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBTableViewCell : UITableViewCell

@property (retain, nonatomic)  UILabel *trackNameLabel;
@property (retain, nonatomic) UILabel *collectionNameLabel;
@property (retain, nonatomic) UILabel *priceLabel;
@property (retain, nonatomic) UILabel *artistNameLabel;
@property (retain,nonatomic)  UIImageView *imageView;
@property (retain,nonatomic) UIView* separatorLineView;
@end
