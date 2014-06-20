//
//  SBControllerForParsing.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForParsing.h"
@interface SBControllerForParsing ()

@property (assign)dispatch_queue_t parseQueue;
@property (assign)NSMutableArray *arrayWithParsedData;
@end

@implementation SBControllerForParsing

@synthesize delegate;
@synthesize parseQueue;
@synthesize arrayWithParsedData;

+ (id)sharedManagerForParsing {
    static SBControllerForParsing *sharedMyManagerForParsing = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForParsing = [[self alloc] init];});
    
    return sharedMyManagerForParsing;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        parseQueue = dispatch_queue_create("parse", NULL);
       
    }
    return self;
}
-(void)parseData:(NSData *)data
{
    

    
    //to put a block on a queue
    dispatch_async (parseQueue,^{
        
        NSError* error;
       arrayWithParsedData=[[NSMutableArray alloc]init];
        //json searialization returns a dictionary with 2 objects  results dictionary and  results count
        NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //store the dictionary of results in a array
        [jsonDictionary retain];
        NSArray *jsonArrayContainingDictionary= [jsonDictionary objectForKey:@"results"];
    
        
        //for each object in the array extract the relevant data and store it in the musicData object and store it in another array
        for(int i=0;i<jsonArrayContainingDictionary.count;i++)
        {
            NSDictionary *dictionary = [jsonArrayContainingDictionary objectAtIndex:i];
            
            //create a object music data to store relevant data from the dictionary
            SBData *musicData=[[SBData alloc]init];
        musicData.trackName=[dictionary objectForKey:@"trackName"];
            musicData.collectionName=[dictionary objectForKey:@"collectionName"];
           musicData.artistName=[dictionary objectForKey:@"artistName"];
            musicData.country=[dictionary objectForKey:@"country"];
            musicData.genereName=[dictionary objectForKey:@"primaryGenreName"];
            
            //for the image download the data from artwork url and create a uiimage with the data
            NSURL *url = [[NSURL alloc] initWithString:[dictionary objectForKey:@"artworkUrl100"]];
            musicData.imageData=[NSData dataWithContentsOfURL:url];
            
        //add the data object to the array
            [arrayWithParsedData addObject:musicData];
            
            
            [musicData release];
            musicData=nil;
            [url release];
            url =nil;
           
        }
      

        //after all data is parsed call the delegate method to save it
         [delegate saveData:arrayWithParsedData];
        
        //release the data
        [jsonDictionary release];
        [arrayWithParsedData release];
        
    });
    
   
}
- (void)dealloc
{
    [parseQueue release];
    parseQueue=nil;
    
        [super dealloc];
}
@end
