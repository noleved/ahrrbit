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
    
    self.service = [[AHRRService alloc] init];
    
    [self.service sync:^(NSArray *elements, NSError *error)
    {
        
    }];
}

@end
