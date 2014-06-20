//
//  SBData.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBData.h"

@implementation SBData


@synthesize  imageData;
@synthesize  trackName;
@synthesize  collectionName;
@synthesize  artistName;
@synthesize  country;

@synthesize  genereName;


- (void)dealloc
{
    [imageData release];
    imageData=nil;
    
    [trackName release];
    trackName=nil;
    
    [collectionName release];
    collectionName=nil;
    
    [artistName release];
    artistName=nil;
    
    [country release];
    country=nil;
    
    
    
    [genereName release];
    genereName=nil;
    
    [super dealloc];
}

@end
