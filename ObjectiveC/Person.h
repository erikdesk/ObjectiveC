//// MARK: anything i want to share with other files (expose interface)
//
//#pragma once // include-guard. in case we include multiple times.
//#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@interface Person : NSObject
//
//@property (nonatomic) NSString *address; // property here because want to expose. auto getter and setter.
//// atomic - not thread-safe, can be accessed by multiple threads.
//// default is readwrite, default is atomic
//// readonly creates only getter, no setter.
//// put all as atomic.
//// copy - without copy, returns pointer. copy will always make new value-copy.
//// asign - primative value is default assign.
//// default strong.
//// delegate make weak.
//
//
//- (instancetype)initWithName: (NSString *) name andAge: (int) age;
//- (NSString *) name;
//- (int) age;
//
//+ (void) printHello; // expose method
//
//@end
//
//NS_ASSUME_NONNULL_END
