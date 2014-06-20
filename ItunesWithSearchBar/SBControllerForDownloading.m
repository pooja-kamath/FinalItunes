//
//  SBControllerForDownloading.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBControllerForDownloading.h"
#import "SBControllerForParsing.h"

@interface SBControllerForDownloading ()

//bool variable to check if the download is started
@property (assign) bool didBeginDownload;

//queue for download request
@property (assign)dispatch_queue_t downloadQueue;

@end

@implementation SBControllerForDownloading

@synthesize downloadQueue;
@synthesize didBeginDownload;

//creating a singleton
+(id)sharedManagerForDownloading
{
    static SBControllerForDownloading *sharedMyManagerForDownloading = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{ sharedMyManagerForDownloading = [[self alloc] init];});
    
    return sharedMyManagerForDownloading;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        //create a download queue
         downloadQueue = dispatch_queue_create("parse", NULL);
        didBeginDownload=NO;
    }
    return self;
}

-(void)downloadDataWithUrl:(NSString *)urlToDownload
{
    //cancel the previous connection if it exsists
       if(didBeginDownload==YES)
    {
        [_downloadConnection cancel];
        
    }
  //release the previous downloaded data
    if(_downloadedData )
    {
        [_downloadedData release];
        _downloadedData=nil;
        
    }
    // create mutable data to store the downloaded data
       _downloadedData = [[NSMutableData alloc] init];
    
     didBeginDownload=YES;
    
    //begin downloading using the string passed as a url
    _downloadConnection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlToDownload]]delegate:self];
    
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   didBeginDownload=YES;
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    didBeginDownload=YES;
    
    //append the data that is recieved to previously recieved data
    [_downloadedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //after the download is complete set the didbegindownload to no
    didBeginDownload=NO;
    
    NSLog(@"downloaded data== \n \n%@",_downloadedData);
    
    //parse the data that has been downloaded
    [[SBControllerForParsing sharedManagerForParsing ]parseData:_downloadedData];
       
}

- (void)dealloc
{
    
    
    [_downloadedData release];
    _downloadedData=nil;
    [super dealloc];
}
@end
