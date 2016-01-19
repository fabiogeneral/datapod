//
//  CentreTableViewCell.m
//  DataPod
//
//  Created by Fabio General on 1/14/16.
//  Copyright © 2016 Fabio General. All rights reserved.
//

#import "CentreTableViewCell.h"

@implementation CentreTableViewCell

@synthesize thumbImageView = _thumbImageView;
@synthesize retailerName = _retailerName;
@synthesize title = _title;
@synthesize expiresDate = _expiresDate;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
