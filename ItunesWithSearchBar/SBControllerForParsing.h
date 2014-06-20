//
//  SBControllerForParsing.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBData.h"
@protocol parseDelegate

-(void)saveData:(NSArray*)parsedResultsArray;

@end
@interface SBControllerForParsing : NSObject

@property (assign)id delegate;

+ (id)sharedManagerForParsing;

//method to parse the data that has been recieved
-(void)parseData:(NSData *)data;


@end
