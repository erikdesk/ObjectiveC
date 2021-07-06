//// MARK: implementation details (private stuff). no private/public
//
//#import "Person.h"
//
//// private property
//@interface Person ()
//
//@property (nonatomic) NSString * username;
//
//@end
//
//// static means private to this file (translation unit .m) in C. different meaning from other languages.
//static int count = 0;
//
//@implementation Person {
//    
//    // MARK: instance variables (private).
//    NSString *_name; // convention prefix with underscore instance variable.
//    int _age; // always private. cannot be exposed.
//    
//    // MARK: setters and getters.
//    
//    // MARK: constructor. memory allocation + assign initial value.
//}
//
//// - : instance method
//// + : static method
//
//+ (void) printHello {
//    printf("HELLO\n");
//}
// // objc c style function
//- (instancetype)initWithName: (NSString *) name andAge: (int) age // returns Person.
//{
//    self = [super init];
//    if (self) {
//        _name = @"Erik";
//        _age = 4;
//    }
//    return self;
//}
//
//- (NSString *) name { // convention no 'get'
//    return _name;
//}
//
//- (int) age {
//    return _age;
//}
//
//- (void) setName: (NSString *) name {
//    _name = name;
//}
//
//- (void) printPersonInfo {
//    // instead of [self name], self.name (only time dot is used, accessing properties).
//    self.address = @"hi"; // [self.setAddress]
//}
//
//@end
