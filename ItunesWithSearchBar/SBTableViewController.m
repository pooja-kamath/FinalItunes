//
//  SBTableViewController.m
//  ItunesWithSearchBar
//
//  Created by Pooja Kamath on 13/06/14.
//  Copyright (c) 2014 Pooja Kamath. All rights reserved.
//

#import "SBTableViewController.h"
#import "SBTableViewCell.h"
#import "SBControllerForData.h"
#import "SBControllerForDownloading.h"
#import "SBData.h"
#import "SBDetailViewController.h"

@interface SBTableViewController ()

@property (assign) SBControllerForData *sharedManagerForData;
@property(assign) SBControllerForDownloading *sharedManagerForDownloading;
@property (assign)SBData *dataToDisplayInCell;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UITableView *myTableView;
@property (assign) UIActivityIndicatorView *activityIndicator;

@end

@implementation SBTableViewController
@synthesize myTableView;
@synthesize searchBar;
@synthesize activityIndicator;
@synthesize dataToDisplayInCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
       
          }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    

        _sharedManagerForData = [SBControllerForData sharedManagerForData];
    _sharedManagerForDownloading=[SBControllerForDownloading sharedManagerForDownloading];
    _sharedManagerForData.delegate=self;
    _sharedManagerForDownloading.delegate=self;
  
    [self.tableView registerClass:[SBTableViewCell class] forCellReuseIdentifier:@"SimpleTableItems"];
   
    self.searchBar.delegate=self;

}
//search bar delegate called when  ever the text is entered in the search bar
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //call the controller method to search the song as the text changes in the search bar
    [_sharedManagerForData searchSongForSearchString:searchText];
    
    //create a activity indicator
    activityIndicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator startAnimating];
    //set the activity indicator in the center of the view
  self.activityIndicator.center=self.view.center;
//    self.activityIndicator.center=self.navigationController.view.center;
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator performSelector:@selector(stopAnimating) withObject:self.activityIndicator afterDelay:5.0];
    
   
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
if( _sharedManagerForData.searchResults.count>0)
{
  
    // Return the number search resuts recieved.
    return _sharedManagerForData.searchResults.count;
}
    else
        return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
     //create a cell and initialise its value
    SBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableItems"];
     dataToDisplayInCell=[[[SBData alloc]init]autorelease];

        dataToDisplayInCell=[_sharedManagerForData.searchResults objectAtIndex:indexPath.row];
        cell.trackNameLabel.text=dataToDisplayInCell.trackName;
        cell.collectionNameLabel.text=dataToDisplayInCell.collectionName;
        cell.artistNameLabel.text=dataToDisplayInCell.artistName;
    cell.imageView.image=[[[UIImage alloc]initWithData:dataToDisplayInCell.imageData]autorelease];
   
    
         return cell;
}




-(void)refreshView
{
    //reload the data on the main thread
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender
{
    //set the detail view data to display
    if ([segue.identifier isEqualToString:@"detailViewSegue"])
    {
        SBDetailViewController *detailView = (SBDetailViewController *)segue.destinationViewController;
        detailView.dataToDisplay=[_sharedManagerForData.searchResults objectAtIndex:sender.row];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //when ever a cell is selected set  its index value and perform segue
    
    [self performSegueWithIdentifier:@"detailViewSegue" sender:indexPath];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //when ever search bar button is clicked resign keyboard and search the song
    [self.searchBar resignFirstResponder];
    [_sharedManagerForData searchSongForSearchString:self.searchBar.text];
}
- (void)dealloc {
    
    [activityIndicator release];
    activityIndicator=nil;
    
    [dataToDisplayInCell release];
    dataToDisplayInCell=nil;
    
    [searchBar release];
    searchBar=nil;
    
    [myTableView release];
    myTableView=nil;
    [super dealloc];
}
@end
