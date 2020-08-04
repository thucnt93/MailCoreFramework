//
//  ViewController.h
//  MacMailCoreDemo
//
//  Created by Thuc Nguyen on 7/30/20.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <MailCore/MailCore.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *fromEmailTextField;
@property (weak) IBOutlet NSTextField *toEmailTextField;
@property (weak) IBOutlet NSTextField *passWordTextField;
@property (weak) IBOutlet NSTextField *subjectTextfield;
@property (weak) IBOutlet NSTextField *bodyTextField;
@property (weak) IBOutlet NSProgressIndicator *indicator;
@property (weak) IBOutlet NSTextField *portTextField;
@property (weak) IBOutlet NSTextField *hostTextField;
@property (weak) IBOutlet NSButton *sendmailButton;
@property (weak) IBOutlet NSTextField *authTypeTextField;
@property (weak) IBOutlet NSButton *fetchMailButton;


@end

