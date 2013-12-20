//
//  AHRRLoginViewController.h
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHRRLoginViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong)NSArray* fields;
@property (nonatomic,strong)NSMutableArray* cells;


- (BOOL)saveCredential;
- (IBAction)buttonTouched:(id)sender;

@end
