//
//  AHRRLoginViewController.m
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRLoginViewController.h"
#import "AHRRTextFieldCell.h"
#import "AHRRService.h"

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

    self.cells = [[NSMutableArray alloc] init];

    self.fields = @[
                    @{@"name":@"email", @"type":@"text", @"value":@""},
                    @{@"name":@"name", @"type":@"text", @"value":[NSNull null]},
                    @{@"name":@"password", @"type":@"password", @"value":[NSNull null]},
                    @{@"name":@"server", @"type":@"text", @"value":[NSNull null]},
                    @{@"name":@"token", @"type":@"text", @"value":[NSNull null]}
                    ];

    self.fieldNames = @[@"login", @"password", @"host", @"authKey"];
    
    // deep magic start here...
    self.service = [[AHRRService alloc] initWithBaseUrl:@"http://noleved-errbit.herokuapp.com/api/v1/" modelName:@"AHRRProblem"];
    [self.service fetchRemoteProblems:^(id elements, NSError *error) {
        if (nil == error)
        {
            NSLog(@"elements: %@", elements);
        }
    }];
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


    if(self.cells.count <= indexPath.row || nil == self.cells[indexPath.row])
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AHRRTextFieldCell" owner:nil options:nil] firstObject];
        [cell setupWithFieldOptions:valueForIndex];
        [self.cells addObject:cell];

    }else{
        cell = self.cells[indexPath.row];
    }

    return cell;
}

# pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 100.0f;
//}

- (void)readCredential{

}

- (BOOL)saveCredential{
    for (int i = 0; i<self.fields.count; i++) {
        NSLog(@"%@", [self.cells[i] getFieldValue]);
    }
    return YES;
}

- (IBAction)buttonTouched:(id)sender {
    NSLog(@"%@",@"touch");
    [self saveCredential];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 100.0f;
//}

@end
