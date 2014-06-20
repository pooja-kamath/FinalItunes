//
//  SBControllerForData.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBData.h"
#import "SBControllerForParsing.h"

@protocol managerForDataDelegate

//delegate to reload the table view with the search results
-(void) refreshView;

@end

@interface SBControllerForData : NSObject <parseDelegate>

//array to store the search results
@property (assign) NSMutableArray *searchResults;
@property (assign) id delegate;


+ (id)sharedManagerForData;

//method to search song using the given search string
-(void)searchSongForSearchString:(NSString *)searchString;

@end
