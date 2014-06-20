//
//  SBTableViewCell.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewCell.h"

@implementation SBTableViewCell
@synthesize artistNameLabel;
@synthesize trackNameLabel;
@synthesize collectionNameLabel;
@synthesize priceLabel;
@synthesize imageView;
@synthesize separatorLineView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //create cell components and add it to the cell
               [self.contentView clearsContextBeforeDrawing];
        trackNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
         collectionNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [trackNameLabel setTextAlignment:NSTextAlignmentCenter];
        [trackNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview: trackNameLabel];
        
     
        collectionNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        collectionNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:12];
        [collectionNameLabel setTextAlignment:NSTextAlignmentCenter];
        [collectionNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:collectionNameLabel];
        
        
       
        priceLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        priceLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [priceLabel setTextAlignment:NSTextAlignmentCenter];
        [priceLabel setText: @"My " ];
        [priceLabel setTextColor: [UIColor blackColor]];
        [self addSubview:priceLabel];
        
    
        artistNameLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        artistNameLabel.font=[UIFont fontWithName:@"TimesNewRomanPS-ItalicMT" size:14];
        [artistNameLabel setTextAlignment:NSTextAlignmentCenter];
        [artistNameLabel setText: @"My Label" ];
        [artistNameLabel setTextColor: [UIColor blackColor]];
        [self addSubview:artistNameLabel];
        
        imageView=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:imageView];
    
       separatorLineView = [[UIView alloc] initWithFrame:CGRectZero];/// change size as you need.
        separatorLineView.backgroundColor = [UIColor grayColor];// you can also put image here
        [self addSubview:separatorLineView];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    //set the frames based on orientation
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
    {
        [separatorLineView setFrame:CGRectMake(5, 0, 310, 0.6)];
           [trackNameLabel setFrame:CGRectMake( 120, 5, 200, 30 )];
    [collectionNameLabel setFrame:CGRectMake(120, 30, 200, 15)];
  
    [artistNameLabel setFrame:CGRectMake(150, 80,150, 15)];
    [imageView setFrame:CGRectMake(10, 10, 100,100)];
    }
    else
    {
       
        [separatorLineView setFrame:CGRectMake(5, 0, 555, 0.6)];
        [trackNameLabel setFrame:CGRectMake( 145, 5, 400, 30 )];
        [collectionNameLabel setFrame:CGRectMake(145, 30, 400, 15)];
       
        [artistNameLabel setFrame:CGRectMake(220, 80,200, 15)];
        [imageView setFrame:CGRectMake(10, 10, 130,100)];
    }
    
    
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)dealloc
{
    [separatorLineView release];
    separatorLineView=nil;
    [trackNameLabel release];
    trackNameLabel=nil;
   [collectionNameLabel release];
    collectionNameLabel=nil;
    [priceLabel release];
    priceLabel=nil;
   [artistNameLabel release];
    artistNameLabel=nil;
    [imageView release];
    imageView=nil;
    [super dealloc];
}

@end
