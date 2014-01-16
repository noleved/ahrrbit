//
//  AHRRHomeViewController.m
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRHomeViewController.h"

#import "AHRRService.h"

@interface AHRRHomeViewController ()

@property (nonatomic, strong) AHRRService *service;

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
            NSLog(@"app: %@", elements);
        }];
    }];
}

@end
