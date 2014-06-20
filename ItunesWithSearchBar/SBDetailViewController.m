//
//  SBDetailViewController.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBDetailViewController.h"

@interface SBDetailViewController ()

@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UILabel *artistLabel;
@property (retain, nonatomic) IBOutlet UILabel *trackLabel;
@property (retain, nonatomic) IBOutlet UILabel *collectionLabel;
@property (retain, nonatomic) IBOutlet UILabel *GenereLabel;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UILabel *countryLabel;
@end

@implementation SBDetailViewController
@synthesize dataToDisplay;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLayoutSubviews {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
       self.scrollView.contentSize = CGSizeMake(320, 500);
    }
    else
    {
        self.scrollView.contentSize=CGSizeMake(300, 500);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //set the label value
    _artistLabel.text=dataToDisplay.artistName;
    _trackLabel.text=dataToDisplay.trackName;
    _collectionLabel.text=dataToDisplay.collectionName;
    _GenereLabel.text=dataToDisplay.genereName;
    _countryLabel.text=dataToDisplay.country;
   

    _imageView.image=[[[UIImage alloc]initWithData:dataToDisplay.imageData]autorelease];
   
    
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    
    [_imageView release];
    _imageView=nil;
    [_artistLabel release];
    _artistLabel=nil;
    [_trackLabel release];
    _trackLabel=nil;
    [_collectionLabel release];
    _collectionLabel=nil;
    [_GenereLabel release];
    _GenereLabel=nil;
    [_countryLabel release];
    _countryLabel=nil;
    [_scrollView release];
    _scrollView=nil;
   
    [super dealloc];
}
@end
