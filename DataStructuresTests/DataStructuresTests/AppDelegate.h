//
//  AppDelegate.h
//  DataStructuresTests
//
//  Created by Bruno Vandekerkhove on 05/09/17.
//  Copyright (c) 2017 Bruno Vandekerkhove. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CircularBuffer, Queue;

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    
    CircularBuffer *buffer;
    Queue *queue;
    
    IBOutlet NSTextField *field;
    IBOutlet NSTextView *textView;
    
}

- (IBAction)add:(id)sender;
- (IBAction)removeFirst:(id)sender;

@end

