//
//  ViewController.m
//  MatchedUp
//
//  Created by Daniel Kwiatkowski on 2015-05-11.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveUserButtonPressed:(UIButton *)sender {
    PFObject *loginCredentials = [PFObject objectWithClassName:@"LoginCredientials"];
    loginCredentials[@"name"] = self.userNameTextField.text;
    loginCredentials[@"password"]= self.passwordTextField.text;
    
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Save" message:@"Your object has been saved" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
            NSLog(@"Saved Successful");
        } else if (error){
            NSLog(@"%@",error);
        }
    }];
}

@end
