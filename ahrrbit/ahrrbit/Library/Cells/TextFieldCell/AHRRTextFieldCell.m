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

-(void)setupWithField:(NSString *)fieldname secure:(BOOL)secure
{   self.inputField.secureTextEntry = secure;
    self.fieldLabel.text = fieldname;
    
}

-(NSString *)getFieldValue
{
    return self.fieldLabel.text;
}

@end
