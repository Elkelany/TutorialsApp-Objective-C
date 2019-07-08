//
//  ViewController.m
//  Tutorials
//
//  Created by macOS on 7/7/19.
//  Copyright © 2019 macOS. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "VideoCell.h"
#import "Video.h"
#import "VideoVC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance]getTutorials:^(NSDictionary * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *item in dataArray) {
                Video *vid = [[Video alloc]init];
                vid.videoTitle = [item objectForKey:@"title"];
                vid.videoDescription = [item objectForKey:@"description"];
                vid.videoIframe = [item objectForKey:@"iframe"];
                vid.thumbnailURL = [item objectForKey:@"thumbnail"];
                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableView];
            
        } else if (errMessage) {
            // Display alert to user
        }
    }];
}

- (void) updateTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showVideoVC" sender:video];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *vidCell = (VideoCell*)cell;
    Video *vid = [self.videoList objectAtIndex:indexPath.row];
    [vidCell updateUI:vid];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"Main"];
    
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 109;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    VideoVC *vc = (VideoVC*)segue.destinationViewController;
    Video *video = (Video*)sender;
    vc.video = video;
}

@end
