//
//  ViewController.m
//  TwttrChckr-iOS
//
//  Created by Alex Vallorosi on 2/25/14.
//  Copyright (c) 2014 Alex Vallorosi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)twitter
{
    [self request:@"twitter" username:usernameInput.text];
}

-(IBAction)github
{
    [self request:@"github" username:usernameInput.text];
}

-(IBAction)instagram
{
    [self request:@"instagram" username:usernameInput.text];
}

-(void)request:(NSString *) network username:(NSString *) username
{
    NSLog(@"\nNetwork: %@\nUsername: %@", network, username);
    usernameLabel.text = [NSString stringWithFormat:@"Username: %@\nNetwork: %@", username, network];
    // Dispatch request here with AFNetworking
    // %@ means you're catting a string
    // %i meand integer
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@.com/%@", network, username]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    receivedData = [NSMutableData dataWithCapacity: 0];
    
    [request setHTTPMethod:@"GET"];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];

    if (!theConnection) {
        // Release the receivedData object.
        receivedData = nil;
        NSLog(@"Get that username!");
        // Inform the user that the connection failed.
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if ([response respondsToSelector:@selector(statusCode)])
    {
        int statusCode = [((NSHTTPURLResponse *)response) statusCode];
        if (statusCode >= 400)
        {
            [connection cancel];  // stop connecting; no more delegate messages
            [self getName];
        }
        else
        {
            [self failName];
        }
    }
}

- (void)getName
{
    statusLabel.textColor = [UIColor greenColor];
    statusLabel.text = @"GET NAME!";
}

- (void)failName
{
    statusLabel.textColor = [UIColor redColor];
    statusLabel.text = @"UNAVAILABLE!";
}

- (IBAction)clear
{
    usernameInput.text = @"";
    usernameLabel.text = @"Username:\nNetwork:";
}

@end
