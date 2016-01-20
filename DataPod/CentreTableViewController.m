//
//  CentreTableViewController.m
//  DataPod
//
//  Created by Fabio General on 1/7/16.
//  Copyright © 2016 Fabio General. All rights reserved.
//

#import "CentreTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "CentreTableViewCell.h"

@interface CentreTableViewController ()

@property (nonatomic) NSMutableArray *centre;

@end

@implementation CentreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.centre = [NSMutableArray new]; // new is essencial

#pragma mark - Essay to show the keys short_name and state of westfield api

//    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.westfield.io/v1/"]];
//    [sessionManager GET:@"centres" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSArray *centres = responseObject[@"data"];
//        for (NSDictionary *dict in centres) {
//            [self.centre addObject:@{
//                                     @"title" : dict[@"short_name"],
//                                     @"subtitle" : dict[@"state"],
//                                     }];
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{ // block necessary to external data
//            [self.tableView reloadData];
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
#pragma mark - Essay to show the San Francisco westfield api data
    
//    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.westfield.io/v1/"]];
//    [sessionManager GET:@"centres" parameters:@{ @"centre_id" : @"sanfrancisco" } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSDictionary *sfcentre = responseObject[@"data"][0];
//        for (NSString *key in [sfcentre allKeys]) {
//            if ([[sfcentre objectForKey:key] isKindOfClass:[NSString class]]) {
//                [self.centre addObject:@{
//                                         @"title" : [key capitalizedString],
//                                         @"subtitle" : [sfcentre objectForKey:key],
//                                         }];
//            }
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{ // block necessary to external data
//            [self.tableView reloadData];
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
#pragma mark - Essay to show the San Francisco westfield api deals
    
      AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.westfield.io/v1/"]];
      [sessionManager GET:@"deals" parameters:@{ @"centre_id" : @"sanfrancisco" } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
          NSArray *sfdeals = responseObject[@"data"];
          for (NSDictionary *dict in sfdeals) {
                  [self.centre addObject:@{
                                           @"image" : [dict[@"_links"][@"image"][@"href"] description],
                                           @"title" : dict[@"title"],
                                           @"expires" : dict[@"ends_at"],
                                           @"retailer" : [dict[@"_links"][@"retailer"] objectForKey:@"name"],
                                           ///////////// others examples
                                           //@"name" : [dict[@"deal_id"] description], // example of non string
                                           //@"name" : [dict[@"stores"][0] objectForKey:@"centre_id"], // example of string inside array
                                           //@"name" : [dict[@"_links"][@"retailer"] objectForKey:@"name"], // example of dictionary inside dictionary
                                           }];
          }
          dispatch_async(dispatch_get_main_queue(), ^{ // block necessary to external data
              [self.tableView reloadData];
          });
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          NSLog(@"%@", error);
      }];
    
// showing deals allkeys san francisco
//    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.westfield.io/v1/"]];
//    [sessionManager GET:@"deals" parameters:@{ @"centre_id" : @"sanfrancisco" } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSDictionary *sfcentre = responseObject[@"data"][0];
//                for (NSString *key in [sfcentre allKeys]) {
//                    if ([[sfcentre objectForKey:key] isKindOfClass:[NSString class]]) {
//                        [self.centre addObject:@{
//                                                 @"title" : [key capitalizedString],
//                                                 @"subtitle" : [sfcentre objectForKey:key],
//                                                 }];
//                    }
//                }
//        dispatch_async(dispatch_get_main_queue(), ^{ // block necessary to external data
//            [self.tableView reloadData];
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.centre count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CentreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CentreTableViewCell" owner:self options:nil];
    cell = [nib firstObject];
    
    NSDictionary *label = self.centre[indexPath.row];
    //cell.thumbImageView.image = [UIImage imageNamed:@"lgrtdnonhhy7hxdhqi45.jpg"]; //test
    //NSString *imageData = @"http://res.cloudinary.com/wlabs/image/upload/oaoy6vz9mxxcyv6wphxu.jpg"; // test
    // IMPORTANT ::: It's necessary add a row in .plist file - App Transport Security Settings dictionary and inside Allow Arbitrary Loads YES (because is not https)
    cell.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@", label[@"image"]]];
    cell.retailerName.text = label[@"retailer"];
    cell.title.text = label[@"title"];
    cell.expiresDate.text = label[@"expires"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
