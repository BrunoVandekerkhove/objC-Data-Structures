//
//  Queue.h
//
//  Created by Bruno Vandekerkhove on 13/06/16.
//  Copyright (c) 2016 BV. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * The `Queue` class represents a first-in first-out (FIFO) queue.
 *  It can have a maximum size, limiting the number of nodes it can keep.
 * Enqueued items are retained, dequeued items are released.
 */
@interface Queue : NSObject {
    
    struct Node *first, *last;
    unsigned int _maxSize, _size;
    
}

/**
 * The maximum size of this queue, that is, the maximum number of nodes it can keep track of.
 */
@property (nonatomic, readwrite) unsigned int maxSize;

/**
 * The size of this queue, that is, the number of nodes it contains.
 */
@property (nonatomic, readonly) unsigned int size;

/**
 * Check whether or not this queue is empty.
 *
 * @return True if and only if the size of this queue equals zero.
 */
- (BOOL)isEmpty;

/**
 * Add the given item to this queue.
 *
 * @param item The item to enqueue.
 * @note The item is retained by the queue (and released when it is removed).
 */
- (void)enqueue:(id)item;

/**
 * Return the item in the queue that was the first to be enqueued.
 *
 * @return The item first added to this queue.
 */
- (id)dequeue;

/**
 * Represents a text representation of this queue, listing all its elements in reverse order (from last to first).
 *
 * @return A string representing this queue.
 */
- (NSString *)stringRepresentation;

@end
