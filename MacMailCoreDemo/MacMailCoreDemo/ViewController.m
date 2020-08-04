//
//  ViewController.m
//  MacMailCoreDemo
//
//  Created by Thuc Nguyen on 7/30/20.
//  Copyright © 2020 Thuc Nguyen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDefaultAccountSetting];
    [self loadIndicatorEnabled:NO onActionButton:self.sendmailButton];
}

- (void)initDefaultAccountSetting {
    NSString *fromEmail = @"thucnt93@flomail.net";
    NSString *fromPassword = @"your pass";
    NSString *toEmail = @"thucan10@gmail.com";
    NSString *subject = @"Email subject"; //
    NSString *body = @"Mail Content";
    NSInteger defaultPort = 587;
    NSString *defaultHost = @"mail.flomail.net";
    
    NSInteger defaultAuthenType = MCOAuthTypeSASLLogin;
    
    self.fromEmailTextField.stringValue = fromEmail;
    self.passWordTextField.stringValue = fromPassword;
    self.toEmailTextField.stringValue = toEmail;
    self.subjectTextfield.stringValue = subject;
    self.bodyTextField.stringValue = body;
    self.portTextField.stringValue = [NSString stringWithFormat:@"%ld", (long)defaultPort];
    self.hostTextField.stringValue = defaultHost;
    self.authTypeTextField.stringValue = [NSString stringWithFormat:@"%ld", (long)defaultAuthenType];
    
    
}

- (void)loadIndicatorEnabled:(BOOL)isEnabled onActionButton:(NSButton *)button {
    
    [button setEnabled:!isEnabled];
    [self.indicator setHidden:!isEnabled];
    
    if (isEnabled) {
        [self.indicator startAnimation:self];
    } else {
        [self.indicator stopAnimation:self];
    }
}

- (IBAction)reset:(id)sender {
    [self initDefaultAccountSetting];
}

- (IBAction)sendMailTap:(id)sender {
    [self loadIndicatorEnabled:YES onActionButton:self.sendmailButton];
    MCOSMTPSession *smtpSession = [[MCOSMTPSession alloc] init];
    smtpSession.hostname = self.hostTextField.stringValue;
    smtpSession.port = [self.portTextField.stringValue intValue];
    smtpSession.username = self.fromEmailTextField.stringValue;
    smtpSession.password = self.passWordTextField.stringValue;
    
    if ([self.authTypeTextField.stringValue intValue]) {
        smtpSession.authType = [self.authTypeTextField.stringValue intValue];
    }
    
    smtpSession.connectionType = MCOConnectionTypeStartTLS;
    NSString *fromStringMail = self.fromEmailTextField.stringValue;
    NSString *toStringMail = self.toEmailTextField.stringValue;
    NSString *subject = self.subjectTextfield.stringValue;
    NSString *body = self.bodyTextField.stringValue;
    
    MCOMessageBuilder *builder = [[MCOMessageBuilder alloc] init];
    MCOAddress *from = [MCOAddress addressWithDisplayName:fromStringMail mailbox:fromStringMail];
    MCOAddress *to = [MCOAddress addressWithDisplayName:toStringMail mailbox:toStringMail];
    [[builder header] setFrom:from];
    [[builder header] setTo:@[to]];
    [[builder header] setSubject:subject];
    [builder setTextBody:body];
    
    MCOSMTPSendOperation *sendOperation = [smtpSession sendOperationWithData:[builder data]];
    __weak typeof(self) weakSelf = self;
    [sendOperation start:^(NSError *error) {
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf loadIndicatorEnabled:NO onActionButton:self.sendmailButton];
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSAlertStyleWarning];
        
        if (error) {
            [alert setMessageText:[NSString stringWithFormat:@"Error sending email: %@", error]];
            [alert addButtonWithTitle:@"Cancel"];
        } else {
            [alert setMessageText:@"Successfully sent email!"];
            [alert addButtonWithTitle:@"OK"];
        }
        [alert runModal];
    }];
}

- (IBAction)fetchMailTap:(id)sender {
    
    /*
     Turn off 2 factor step verification in gmail setting to allow access to gmail folder
     */
    [self loadIndicatorEnabled:YES onActionButton:self.fetchMailButton];
    MCOIMAPSession *session = [[MCOIMAPSession alloc] init];
    [session setHostname:@"imap.gmail.com"];
    [session setPort:993];
    [session setUsername:@"thanhthuc041293@gmail.com"];
    [session setPassword:@"yourGmailPass"]; // Input your gmail pass
    [session setConnectionType:MCOConnectionTypeTLS];
    
    MCOIMAPMessagesRequestKind requestKind = MCOIMAPMessagesRequestKindHeaders;
    NSString *folder = @"INBOX";
    MCOIndexSet *uids = [MCOIndexSet indexSetWithRange:MCORangeMake(1, UINT64_MAX)];
    
    MCOIMAPFetchMessagesOperation *fetchOperation = [session fetchMessagesOperationWithFolder:folder requestKind:requestKind uids:uids];
    
    __weak typeof(self) weakSelf = self;
    [fetchOperation start:^(NSError * error, NSArray * fetchedMessages, MCOIndexSet * vanishedMessages) {
        //We've finished downloading the messages!
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf loadIndicatorEnabled:NO onActionButton:self.fetchMailButton];
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setAlertStyle:NSAlertStyleWarning];
        
        if (error) {
            [alert setMessageText:[NSString stringWithFormat:@"Error fetch email: %@", error]];
            [alert addButtonWithTitle:@"Cancel"];
        } else {
            [alert setMessageText:@"Successfully fetch email!"];
            [alert addButtonWithTitle:@"OK"];
        }
        [alert runModal];
       
    }];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
