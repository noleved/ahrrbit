//
//  AHRRService.m
//  ahrrbit
//
//  Created by Francesco Laruffa on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRService.h"
#import "AHRRDatabase.h"

@interface AHRRService ()

@property (nonatomic, strong) AHRRDatabase *database;

@end

@implementation AHRRService

- (instancetype)initWithBaseUrl:(NSString *)baseUrl modelName:(NSString *)modelName
{
    if (self = [super init]) {
        self.baseUrl = baseUrl;
        
    }
    return self;
}

- (void)getApplications:(AHRRServiceListBlock)completion
{
    [self.database selectAll:nil completion:^(NSArray *elements, NSError *error)
    {
         if (completion)
         {
             completion(elements, error);
         }
    }];
}

- (void)addConfiguration:(AHRConfiguration *)configuration
{
    
}

@end
