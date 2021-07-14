// https://support.swiftify.com/hc/en-us/articles/360025400031-Exposing-all-your-Swift-files-to-Objective-C-in-one-line-of-code-using-a-Precompiled-Header-File

#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Pizza.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Please pick your pizza size and toppings:");
        Kitchen *kitchen = [Kitchen new];
        
        while (YES) {
            NSLog(@"> ");
            char str[100];
            fgets(str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"Input was %@", inputString);
            
            NSMutableArray *commandWords = [NSMutableArray new];
            commandWords = [[inputString componentsSeparatedByString:@" "] mutableCopy];
            
            PizzaSize pizzaSize;
            if ([[commandWords objectAtIndex:0]  isEqual: @"small"]) {
                pizzaSize = Small;
            } else if ([[commandWords objectAtIndex:0]  isEqual: @"medium"]) {
                pizzaSize = Medium;
            } else if ([[commandWords objectAtIndex:0]  isEqual: @"large"]) {
                pizzaSize = Large;
            }
            [commandWords removeObjectAtIndex:0];
            NSMutableArray *toppings;
            toppings = commandWords;
            
            Pizza *pizza = [[Pizza alloc] initWithPizzaSize:pizzaSize withToppings:toppings];
        }
    }
    return 0;
}
