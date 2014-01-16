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

@property (nonatomic, strong) AHRRConfiguration *conf;

@end

@implementation AHRRLoginViewController

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

    self.fieldNames = @[ @"login", @"password", @"host", @"authKey" ];
    
    // deep magic start here...
    self.service = [[AHRRService alloc] initWithBaseUrl:@"http://noleved-errbit.herokuapp.com/api/v1/" modelName:@"AHRRProblem"];
    
//    __weak typeof(self) weakSelf = self;
    
//    [self.service createObject:[AHRRConfiguration class] completion:^(id entity, NSError *error)
//    {
//        weakSelf.conf = entity;
//    }];
    
    NSString *cellName = NSStringFromClass([AHRRTextFieldCell class]);
    
    [self.tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:cellName];
    
    

}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *valueForIndex = self.fields[indexPath.row];
    AHRRTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AHRRTextFieldCell"];
    [cell setupWithFieldOptions:valueForIndex];

    return cell;
}

# pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

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
