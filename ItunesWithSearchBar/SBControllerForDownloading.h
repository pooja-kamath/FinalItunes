//
//  SBControllerForDownloading.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SBControllerForDownloading : NSObject

@property (assign) id delegate;

//connection for downloading
@property (retain, nonatomic) NSURLConnection *downloadConnection;

//connection for storing the downloaded data
@property (retain, nonatomic) NSMutableData *downloadedData;

+ (id)sharedManagerForDownloading;

//method to download using the given string
-(void)downloadDataWithUrl:(NSString *)urlToDownload;
@end
