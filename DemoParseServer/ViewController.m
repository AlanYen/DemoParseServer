//
//  ViewController.m
//  DemoParseServer
//
//  Created by AlanYen on 2015/11/17.
//  Copyright © 2015年 17Life. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUploadButtonClicked:(id)sender {
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD show];
    
    // Get random value between 0 and 99
    NSInteger x = (arc4random() % 100);
    // Get random number between 500 and 1000
    NSInteger y = (arc4random() % 500) + 100;
    
    PFObject *beacon = [PFObject objectWithClassName:@"Beacon"];
    [beacon setObject:[[NSUUID UUID] UUIDString] forKey:@"UUID"];
    [beacon setObject:[@(x) stringValue] forKey:@"Major"];
    [beacon setObject:[@(y) stringValue] forKey:@"Minor"];
    [beacon saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded){
            [SVProgressHUD showSuccessWithStatus:@"上傳成功!!"];
        }
        else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            [SVProgressHUD showErrorWithStatus:errorString];
        }
    }];
}

@end
