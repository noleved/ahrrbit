//
//  AHRRHomeViewController.m
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRHomeViewController.h"

#import "AHRRService.h"
#import "AHRRApplication.h"
#import "AHRRAppDetailViewController.h"

@interface AHRRHomeViewController ()

@property (nonatomic, strong) AHRRService *service;
@property (nonatomic, strong) NSArray *applications;

@end

@implementation AHRRHomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.service = [[AHRRService alloc] initWithBaseUrl:@"http://noleved-errbit.herokuapp.com/api/v1/" modelName:@"AHRRProblem"];
    
    [self.service sync:^(NSArray *elements, NSError *error)
    {
        [self.service getApplications:^(NSArray *elements, NSError *error)
        {
            self.applications = elements;
            [self.tableView reloadData];
            NSLog(@"app: %@", self.applications);

        }];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.applications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appcell"];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"appcell"];
    }
    
    AHRRApplication *item = [self.applications objectAtIndex: [indexPath row]];
    cell.textLabel.text = item.app_name;
    cell.detailTextLabel.text = @"extra details here...";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AHRRAppDetailViewController *detail = [[AHRRAppDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
