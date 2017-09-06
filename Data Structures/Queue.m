//
//  Queue.m
//
//  Created by Bruno Vandekerkhove on 13/06/16.
//  Copyright (c) 2016 BV. All rights reserved.
//

#import "Queue.h"

struct Node { // Represents an item in a queue
    id item;
    struct Node *next;
};

#pragma mark Queue

@implementation Queue

@synthesize maxSize = _maxSize, size = _size;

#pragma mark Constructors

- (id)init {
    
    if (self = [super init]) {
        
        _size = 0;
        self.maxSize = UINT_MAX;
        
    }
    
    return self;
    
}


#pragma mark Getters

- (BOOL)isEmpty {
    
    return self.size == 0;
    
}

#pragma mark Setters

- (void)setMaxSize:(unsigned int)maxSize {
    
    _maxSize = maxSize;
    
    struct Node *oldFirst;
    while (_size > maxSize) {
        oldFirst = first;
        first = first->next;
        _size--;
        [oldFirst->item release];
        free(oldFirst);
    }
    
}

#pragma mark (En)queuing

- (void)enqueue:(id)item { // Add the item at the end of the queue
    
    struct Node *temp = (struct Node *)malloc(sizeof(struct Node));
    temp->item = [item retain];
    temp->next = NULL;
    
    _size++;
    
    if (first == NULL && last == NULL) {
        first = last = temp;
        return;
    }
    
    last->next = temp;
    last = temp;
    
    if (_size > self.maxSize) {
        temp = first;
        first = first->next;
        [temp->item release];
        free(temp);
        _size--;
    }
    
}

- (id)dequeue { // Remove the item at the front of the queue
    
    if (first != NULL) {
        
        struct Node *temp = first;
        id item = first->item;
        
        if (first == last)
            first = last = NULL;
        else
            first = first->next;
    
        [temp->item release];
        free(temp);
        
        _size--;
        
        return item;
        
    }
    
    return nil;
    
}

#pragma mark Misc

- (NSString *)stringRepresentation {
    
    NSString *string = @"";
    
    int i=0;
    struct Node *currentNode = first;
    while (currentNode != NULL) {
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%i | %@\n", i++, currentNode->item]];
        currentNode = currentNode->next;
    }
    
    return string;
    
}

#pragma mark Memory Management

- (void)dealloc {
    
    while (!self.isEmpty)
        [self dequeue]; // Free all items in the queue
    
    [super dealloc];
    
}

@end
