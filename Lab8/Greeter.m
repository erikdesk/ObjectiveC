#import "Greeter.h"

@implementation Greeter

- (void)sayHello {
    if ([self.delegate shouldSayHello]) {
        NSLog(@"Hello");
    } else {
        NSLog(@"...");
    }
}

@end
