//
//  SBDetailViewController.h
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBData.h"
@interface SBDetailViewController : UIViewController

//value set through prepare for segue
@property (assign)SBData *dataToDisplay;
@end
