//
//  AppDelegate.m
//  DataStructuresTests
//
//  Created by Bruno Vandekerkhove on 05/09/17.
//  Copyright (c) 2017 Bruno Vandekerkhove. All rights reserved.
//

#import "AppDelegate.h"
#import "Globals.h"

// Available data structures
#import "CircularBuffer.h"
#import "Queue.h"

@interface AppDelegate ()
@property (nonatomic, retain) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    buffer = [CircularBuffer new];
    queue = [Queue new];
    
    
#if TIME_STRUCTURES
    [self timingExperiments];
#endif
    
    [buffer setCapacity:50];
    [queue setMaxSize:3];
    
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    
    return true;
    
}

#pragma mark Actions

- (IBAction)add:(id)sender {
    
    [ACTIVE_STRUCTURE ADD_METHOD:[field stringValue]];
    [self displayConsole];
    [field selectText:nil];
    
}

- (IBAction)removeFirst:(id)sender {
    
    [ACTIVE_STRUCTURE REMOVE_METHOD];
    [self displayConsole];
    
}

- (void)displayConsole {
    
    [textView setString:[ACTIVE_STRUCTURE stringRepresentation]];
    
}

- (void)timingExperiments {
    
    long long tic;
    
    tic = get_timestamp();
    NSMutableArray *array = [NSMutableArray new];
    for (int i=0 ; i<1000000 ; i++)
        [array addObject:@"ABCDEFG"];
    for (int i=0 ; i<1000000 ; i++)
        [array removeLastObject];
    printf("Milliseconds (array) = %lld\n", get_timestamp() - tic);
    
    tic = get_timestamp();
    buffer.capacity = 1000000;
    for (int i=0 ; i<1000000 ; i++)
        [buffer addObject:@"ABCDEFG"];
    for (int i=0 ; i<1000000 ; i++)
        [buffer removeLast];
    printf("Milliseconds (buffer) = %lld\n", get_timestamp() - tic);
    
    tic = get_timestamp();
    for (int i=0 ; i<1000000 ; i++)
        [queue enqueue:@"ABCDEFG"];
    for (int i=0 ; i<1000000 ; i++)
        [queue dequeue];
    printf("Milliseconds (queue) = %lld\n", get_timestamp() - tic);
    
}

#pragma mark Memory

- (void)dealloc {
    
    [queue release];
    
    [super dealloc];
    
}

@end
