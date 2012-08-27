//
//  ViewController.m
//  URLSchemes
//
//  Created by Greg Pierce on 7/27/12.
//  Copyright (c) 2012 Agile Tortoise, Inc. All rights reserved.
//

#import "ViewController.h"
#import "URLParser.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize outgoingURLTextView;
@synthesize urlDataTextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setUrlDataTextView:nil];
    [self setOutgoingURLTextView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


# pragma mark IBActions

- (IBAction)canOpenURLButtonPressed:(id)sender {
    [outgoingURLTextView resignFirstResponder];
    
    if ([self canOpenURLForString:outgoingURLTextView.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YES!" message:@"This URL can be opened on this device." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else {
        [self showBadURLAlert];
    }
}

- (IBAction)openURLButtonPressed:(id)sender {
    [outgoingURLTextView resignFirstResponder];

    if (![self canOpenURLForString:outgoingURLTextView.text]) {
        [self showBadURLAlert];
        return;
    }
    
    NSURL *url = [NSURL URLWithString:outgoingURLTextView.text];
    [[UIApplication sharedApplication] openURL:url];
}

# pragma mark Utility

- (void)showBadURLAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Cannot Open URL" message:@"No installed app can open this URL." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (BOOL)canOpenURLForString:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    return [[UIApplication sharedApplication] canOpenURL:url];
}

- (BOOL)handleIncomingURL:(NSURL *)url
{
    urlDataTextView.text = [url absoluteString];
    
    // Parse parameters
    // There are many ways to do this...I think this simple one...
    URLParser *parser = [[URLParser alloc] initWithURLString:[url absoluteString]];
    NSString *testParamValue = [parser valueForVariable:@"test"];
    NSLog(@"test parameter = %@", testParamValue);    
    
    return YES;
}

@end
