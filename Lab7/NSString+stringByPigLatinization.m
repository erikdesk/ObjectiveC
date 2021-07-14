#import "NSString+stringByPigLatinization.h"

@implementation NSString (stringByPigLatinization)

- (NSString *)stringByPigLatinization {
    
    NSString *latinString = @"";
    
    for (id word in [[self lowercaseString] componentsSeparatedByString:@" "]) {
            
        NSString *latinWord = [NSString stringWithFormat:@"%@", word];
        unsigned long minMoveLocation = [word length];
        
        for (id cluster in @[@"ch", @"sh", @"sm", @"st", @"th", @"ps", @"ph", @"pl", @"gl", @"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"y", @"z"]) {
            
            if ([word rangeOfString:cluster].location < minMoveLocation) {
                
                minMoveLocation = [word rangeOfString:cluster].location;
                
                latinWord = [NSString stringWithFormat:@"%@%@%@ay", [[word substringFromIndex:(NSUInteger)0] substringToIndex:(NSUInteger)[word rangeOfString:cluster].location], [[word substringFromIndex:(NSUInteger)[word rangeOfString:cluster].location] substringToIndex:(NSUInteger)[word rangeOfString:cluster].length], [[word substringFromIndex:(NSUInteger)[word rangeOfString:cluster].location + [word rangeOfString:cluster].length] substringToIndex:(NSUInteger)[word length] - ([word rangeOfString:cluster].location + [word rangeOfString:cluster].length)]];
            }
        }
        latinString = [latinString stringByAppendingFormat:@"%@%@", [latinString length] == 0 ? @"" : @" ", latinWord];

    };
    
    return latinString;
}

@end

//#import "NSString+stringByPigLatinization.h"
//
//@implementation NSString (stringByPigLatinization)
//
//- (NSString *)stringByPigLatinization {
//
//    __block NSString *latinString = @"";
//
//    [[[self lowercaseString] componentsSeparatedByString:@" "] enumerateObjectsUsingBlock:^(NSString * word, NSUInteger index, BOOL * _Nonnull stop) {
//
//        NSString *latinWord = [NSString stringWithFormat:@"%@", word];
//        unsigned long minMoveLocation = [word length];
//
//        for (id cluster in @[@"ch", @"sh", @"sm", @"st", @"th", @"ps", @"ph", @"pl", @"gl", @"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"y", @"z"]) {
//
//            unsigned long frontLocation = 0;
//            unsigned long frontLength = [word rangeOfString:cluster].location;
//
//            unsigned long moveLocation = [word rangeOfString:cluster].location;
//            unsigned long moveLength = [word rangeOfString:cluster].length;
//
//            unsigned long backLocation = [word rangeOfString:cluster].location + [word rangeOfString:cluster].length;
//            unsigned long backLength = [word length] - ([word rangeOfString:cluster].location + [word rangeOfString:cluster].length);
//
//            if ([word rangeOfString:cluster].location < minMoveLocation) {
//
//                minMoveLocation = [word rangeOfString:cluster].location;
//
//                NSString *frontString = [[word substringFromIndex:(NSUInteger)frontLocation] substringToIndex:(NSUInteger)frontLength];
//                NSString *moveString = [[word substringFromIndex:(NSUInteger)moveLocation] substringToIndex:(NSUInteger)moveLength];
//                NSString *backString = [[word substringFromIndex:(NSUInteger)backLocation] substringToIndex:(NSUInteger)backLength];
//
//                latinWord = [NSString stringWithFormat:@"%@%@%@ay", frontString, backString, moveString];
//                NSLog(@"%@", latinWord);
//
//            } else {
//
//            }
//
//        }
//
////        NSLog(@"%lu - %lu", (unsigned long)index, (unsigned long)[latinWordArray count]);
////        [latinWordArray addObject:latinWord];
////        NSLog(@"%@", [[latinString componentsSeparatedByString:@" "] count]);
//        latinString = [latinString stringByAppendingFormat:@"%@%@", [latinString length] == 0 ? @"" : @" ", latinWord];
//
//    }];
//
//    // [latinString stringByAppendingFormat:@"%@%@", [latinString length] == 0 ? @"" : @" ", latinWord];
//    // [[latinWordArray componentsSeparatedByString:@" "]
//    return latinString; // [latinWordArray componentsJoinedByString:@" "];
//}
//
//@end

//@implementation NSString (stringByPigLatinization)
//
//- (NSString *)stringByPigLatinization {
//
//    NSString *latinString = @"";
//
//    NSArray *clusters = @[@"ch", @"sh", @"sm", @"st", @"th", @"ps", @"ph", @"pl", @"gl", @"b", @"c", @"d", @"f", @"g", @"h", @"j", @"k", @"l", @"m", @"n", @"p", @"q", @"r", @"s", @"t", @"v", @"w", @"x", @"y", @"z"];
//
//    NSMutableArray *words = [NSMutableArray new];
//    words = [[[self lowercaseString] componentsSeparatedByString:@" "] mutableCopy];
//
//    for (id word in words) {
//
//        NSString *latinWord = [NSString stringWithFormat:@"%@", word];
//        unsigned long minMoveLocation = [word length];
//
//        for (id cluster in clusters) {
//
//            unsigned long frontLocation = 0;
//            unsigned long frontLength = [word rangeOfString:cluster].location;
//
//            unsigned long moveLocation = [word rangeOfString:cluster].location;
//            unsigned long moveLength = [word rangeOfString:cluster].length;
//
//            unsigned long backLocation = [word rangeOfString:cluster].location + [word rangeOfString:cluster].length;
//            unsigned long backLength = [word length] - backLocation;
//
//            if ([word rangeOfString:cluster].location != NSNotFound) {
//
//                if ([word rangeOfString:cluster].location < minMoveLocation) {
//
//                    minMoveLocation = [word rangeOfString:cluster].location;
//
//                    NSLog(@"-> minMoveLocation: %lu", minMoveLocation);
//
//                    NSLog(@"%@", word);
//                    NSLog(@"frontLocation: %lu", frontLocation);
//                    NSLog(@"frontLength: %lu", frontLength);
//                    NSLog(@"moveLocation: %lu", moveLocation);
//                    NSLog(@"moveLength: %lu", moveLength);
//                    NSLog(@"backLocation: %lu", backLocation);
//                    NSLog(@"backLength: %lu", backLength);
//
//                    NSString *frontString = [[word substringFromIndex:(NSUInteger)frontLocation] substringToIndex:(NSUInteger)frontLength];
//                    NSString *moveString = [[word substringFromIndex:(NSUInteger)moveLocation] substringToIndex:(NSUInteger)moveLength];
//                    NSString *backString = [[word substringFromIndex:(NSUInteger)backLocation] substringToIndex:(NSUInteger)backLength];
//
//                    NSLog(@"frontString: %@", frontString);
//                    NSLog(@"moveString: %@", moveString);
//                    NSLog(@"backString: %@", backString);
//
//                    latinWord = [NSString stringWithFormat:@"%@-%@-%@ay", frontString, backString, moveString];
//
//                }
//
//            }
//
//        }
//
//        NSLog(@">>> latinWord: %@", latinWord);
//
//        latinString = [latinString stringByAppendingFormat:@"%@%@", [latinString length] == 0 ? @"" : @" ", latinWord];
//
//    }
//
//    NSLog(@">>>>>> latinString: %@", latinString);
//
//    return self;
//}
//
//@end
