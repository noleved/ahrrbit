//
//  AHRRButtonCell.h
//  ahrrbit
//
//  Created by Davide Manea on 20/12/13.
//  Copyright (c) 2013 noleved. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHRRButtonCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *fullsizeButton;
- (IBAction)buttonTouched:(id)sender;

-(void)setupWithField:(NSString *)fieldname;

@end
