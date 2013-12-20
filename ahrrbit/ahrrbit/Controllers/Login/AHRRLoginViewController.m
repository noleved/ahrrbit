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
    
    self.fields = @[
                    @{@"name":@"email", @"type":@"text", @"value":@"", @"cell":[NSNull null]},
                    @{@"name":@"name", @"type":@"text", @"value":[NSNull null], @"cell":[NSNull null]},
                    @{@"name":@"password", @"type":@"password", @"value":[NSNull null], @"cell":[NSNull null]},
                    @{@"name":@"server", @"type":@"text", @"value":[NSNull null], @"cell":[NSNull null]},
                    @{@"name":@"token", @"type":@"text", @"value":[NSNull null], @"cell":[NSNull null]}
                    ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *valueForIndex = self.fields[indexPath.row];
    AHRRTextFieldCell *cell = nil;
    if([valueForIndex[@"cell"] isEqual:[NSNull null]])
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHRRTextFieldCell" owner:nil options:nil] firstObject];
        [cell setupWithFieldOptions:valueForIndex];
    }
    else{
        cell = valueForIndex[@"cell"];
    }
    return cell;
}

# pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}

- (void)readCredential{

}

- (BOOL)saveCredential{
    for (int i = 0; i>self.fields.count; i++) {
        NSLog(@"%@", [self.fields[i][@"getFieldValue"] getFieldValue]);
    }
    return YES;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 100.0f;
//}

@end
