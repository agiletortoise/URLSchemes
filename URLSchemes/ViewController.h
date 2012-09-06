//
//  ViewController.h
//  URLSchemes
//
//  Created by Greg Pierce on 7/27/12.
//  Copyright (c) 2012 Agile Tortoise, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *outgoingURLTextView;
@property (weak, nonatomic) IBOutlet UITextView *urlDataTextView;

- (IBAction)canOpenURLButtonPressed:(id)sender;
- (IBAction)openURLButtonPressed:(id)sender;
- (IBAction)launchDraftsButtonPressed:(id)sender;
- (IBAction)newDraftButtonPressed:(id)sender;

- (void)showBadURLAlert;
- (BOOL)canOpenURLForString:(NSString *)urlString;
- (BOOL)handleIncomingURL:(NSURL *)url;

@end
