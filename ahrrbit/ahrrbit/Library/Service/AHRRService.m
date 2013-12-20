//
//  AHRRService.m
//  ahrrbit
//
//  Created by Francesco Laruffa on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRService.h"

@implementation AHRRService

- (instancetype)initWithBaseUrl:(NSString *)baseUrl modelName:(NSString *)modelName
{
    if (self = [super init]) {
        self.baseUrl = baseUrl;
        
    }
    return self;
}

@end
