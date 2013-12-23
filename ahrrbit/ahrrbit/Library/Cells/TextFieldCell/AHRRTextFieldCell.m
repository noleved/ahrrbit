//
//  AHRRTextFieldCell.m
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import "AHRRTextFieldCell.h"

@implementation AHRRTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupWithFieldOptions:(NSDictionary *)args
{

    self.inputField.secureTextEntry = [args[@"type"] isEqualToString:@"password" ];
    self.inputField.placeholder = args[@"name"];

}

-(NSString *)getFieldValue
{
  return self.inputField.text;
}

@end
