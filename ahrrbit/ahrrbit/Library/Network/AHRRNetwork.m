//
//  AHRRNetwork.m
//  ahrrbit
//
//  Created by Massimo Oliviero on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRNetwork.h"

#import <RestKit/RestKit.h>

@implementation AHRRNetwork

- (instancetype)initWithUrl:(NSString *)url
{
    if (self = [super init]) {
        self.baseUrl = url;
        [self setupRestKit];
        [self setupMapping];
    }
    return self;
}

- (void)setupRestKit
{
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDefault)
    RKLogConfigureByName("RestKit/Network", RKLogLevelDefault);

    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:self.baseUrl]];
    [RKObjectManager sharedManager].requestSerializationMIMEType = RKMIMETypeFormURLEncoded;
    
    [objectManager.HTTPClient setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
     {
         if (status == AFNetworkReachabilityStatusNotReachable)
         {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"RECHABILITY_ERROR_TITLE", nil)
                                                             message:NSLocalizedString(@"RECHABILITY_ERROR_MESSAGE", nil)
                                                            delegate:nil
                                                   cancelButtonTitle:NSLocalizedString(@"OK", nil)
                                                   otherButtonTitles:nil];
             [alert show];
         }
     }];
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
}

- (void)setupMapping
{
    RKObjectManager *manager = [RKObjectManager sharedManager];
    
}

@end
