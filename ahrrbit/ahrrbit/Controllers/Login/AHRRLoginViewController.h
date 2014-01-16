//
//  AHRRLoginViewController.h
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AHRRService.h"
#import "AHRRConfiguration.h"

@interface AHRRLoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  NSArray *fieldNames;
@property (nonatomic, strong)  AHRRService *service;
@property (nonatomic, strong)  NSArray* fields;
@property (nonatomic, strong)  NSMutableArray* cells;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (BOOL)saveCredential;
- (IBAction)buttonTouched:(id)sender;

@end
