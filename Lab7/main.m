#import <Foundation/Foundation.h>
#import "NSString+stringByPigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str = @"Kale Chips Starch Pop Aiea";
        NSLog(@"%@", [str stringByPigLatinization]);
    }
    return 0;
}
