//
//  SBControllerForData.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForData.h"
#import "SBData.h"
#import "SBControllerForDownloading.h"

@implementation SBControllerForData
@synthesize  searchResults;


//creating a singleton
+ (id)sharedManagerForData
{
    
    static SBControllerForData *sharedMyManagerForData = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForData = [[self alloc] init];});
    
    return sharedMyManagerForData;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //create the search results array
        searchResults=[[NSMutableArray alloc]init];
    }
    return self;
}

-(void)searchSongForSearchString:(NSString *)searchString
{
    //assigning self as delegate of parsing controller to save the data that has been parsed
    SBControllerForParsing *sharedManagerForParsing= [SBControllerForParsing sharedManagerForParsing];
    sharedManagerForParsing.delegate=self;
    
    //create itunes search api url
    NSString * initialStringToAppendToUrl=@"https://itunes.apple.com/search?term=";
    NSString *finalStringToAppendToUrl=@"&entity=musicVideo&limit=25";
    searchString=[searchString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *searchUrl=[initialStringToAppendToUrl stringByAppendingString:searchString];
    searchUrl=[searchUrl stringByAppendingString:finalStringToAppendToUrl];
    
   
    
    //download using the url created
    [[SBControllerForDownloading sharedManagerForDownloading]downloadDataWithUrl:searchUrl];
   
}

//delegate method called when the parsing is completed
-(void)saveData:(NSArray*)parsedResultsArray
{
    
    //remove the previous search results
   [searchResults removeAllObjects];
    
    //add the new results to the searchResults array
       [ searchResults addObjectsFromArray:parsedResultsArray];
    
    //if search results do not exsist  display a alert that there are no search results
       //call the delegate to reload the table
     [_delegate refreshView];
    
}

- (void)dealloc
{
    [searchResults release];
    searchResults=nil;
    [super dealloc];
}
@end
