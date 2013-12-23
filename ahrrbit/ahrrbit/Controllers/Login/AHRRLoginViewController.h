//
//  AHRRLoginViewController.h
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AHRRService.h"

@interface AHRRLoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong)  NSArray *fieldNames;
@property (nonatomic, strong) AHRRService *service;

@end
