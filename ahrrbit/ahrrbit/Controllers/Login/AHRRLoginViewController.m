//
//  AHRRLoginViewController.m
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRLoginViewController.h"
#import "AHRRTextFieldCell.h"

@interface AHRRLoginViewController ()

@end

@implementation AHRRLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Avast! Login";
    self.fieldNames = @[@"login", @"password", @"host", @"authKey"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fieldNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *valueForIndex= self.fieldNames[indexPath.row];
    AHRRTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"text"];
    if (nil ==  cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHRRTextFieldCell" owner:nil options:nil] firstObject];
    }
    
    BOOL secure = [valueForIndex isEqualToString:@"password"];
    
    [cell setupWithField:valueForIndex secure:secure];
    
    return cell;
}

# pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 74.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 100.0f;
//}

@end
