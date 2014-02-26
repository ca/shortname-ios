//
//  ViewController.h
//  TwttrChckr-iOS
//
//  Created by Alex Vallorosi on 2/25/14.
//  Copyright (c) 2014 Alex Vallorosi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *usernameInput;
    IBOutlet UILabel *usernameLabel;
    IBOutlet UILabel *statusLabel;
    NSMutableData *receivedData;
}

- (IBAction)github;
- (IBAction)twitter;
- (IBAction)instagram;

@end