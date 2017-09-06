//
//  Globals.h
//  DataStructuresTests
//
//  Created by Bruno Vandekerkhove on 05/09/17.
//  Copyright (c) 2017 Bruno Vandekerkhove. All rights reserved.
//

//
//  GLOBALS
//

#define TIME_STRUCTURES 1

#define ACTIVE_STRUCTURE buffer
#define ADD_METHOD addObject
#define REMOVE_METHOD removeFirst

//
//  HELPER FUNCTIONS
//

#pragma mark Helper Functions

#include <sys/time.h>

void print_timestamp() {
    struct timeval te;
    gettimeofday(&te, NULL); // get current time
    long long milliseconds = te.tv_sec*1000LL + te.tv_usec/1000; // caculate milliseconds
    printf("%lld\n", milliseconds);
}

long long get_timestamp() {
    struct timeval te;
    gettimeofday(&te, NULL); // get current time
    return te.tv_sec*1000LL + te.tv_usec/1000; // caculate milliseconds
}
