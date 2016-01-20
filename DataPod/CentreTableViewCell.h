//
//  CentreTableViewCell.h
//  DataPod
//
//  Created by Fabio General on 1/14/16.
//  Copyright © 2016 Fabio General. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CentreTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UIImageView *thumbImageView;
@property (nonatomic, weak) IBOutlet UILabel *retailerName;
@property (nonatomic, weak) IBOutlet UILabel *title;
@property (nonatomic, weak) IBOutlet UILabel *expiresDate;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *spinner;

@property (nonatomic) NSURL *imageURL;
@property (nonatomic) UIImage *image;

@end
