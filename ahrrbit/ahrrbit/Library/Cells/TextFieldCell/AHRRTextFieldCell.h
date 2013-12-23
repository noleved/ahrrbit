//
//  AHRRTextFieldCell.h
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHRRTextFieldCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fieldLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

-(void)setupWithFieldOptions:(NSDictionary *)args;

-(NSString *) getFieldValue;

@end
