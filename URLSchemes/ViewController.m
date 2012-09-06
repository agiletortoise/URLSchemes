//
//  ViewController.m
//  URLSchemes
//
//  Created by Greg Pierce on 7/27/12.
//  Copyright (c) 2012 Agile Tortoise, Inc. All rights reserved.
//

#import "ViewController.h"
#import "URLParser.h"
#import "NSString+URLEncoding.h"
#import "Scratchpad.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize outgoingURLTextView;
@synthesize urlDataTextView;

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [Scratchpad examples];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
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

- (IBAction)launchDraftsButtonPressed:(id)sender {
    NSURL *url = [NSURL URLWithString:@"drafts://"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        [self showBadURLAlert];
    }
    
}

- (IBAction)newDraftButtonPressed:(id)sender {
    NSString *urlString = @"drafts://x-callback-url/create?text=%@";
    NSString *text = @"Boo ø´˚∂∆ƒ∂ß¬ƒ∆˚∂ Unicode!";
    NSString *paramText = [text urlEncodeUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:urlString, paramText]];
    NSLog(@"%@", [url absoluteString]);
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else {
        [self showBadURLAlert];
    }
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
