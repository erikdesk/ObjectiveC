// https://stackoverflow.com/questions/3697058/when-to-use-respondstoselector-in-objective-c
#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "Pizza.h"
#import "Manager.h"
#import "FriendlyManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Please pick your pizza size and toppings:");
        Kitchen *kitchen = [Kitchen new];
        Manager *manager = [Manager new];
        FriendlyManager *friendlyManager = [FriendlyManager new];
        
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
            
            NSLog(@"Pick a manager:\n1 - Normal Manager\n2 - Friendly Manager\n3 - None.");
            NSLog(@"> ");
            char managerStr[100];
            fgets(managerStr, 100, stdin);
            NSString *managerInputString = [[NSString alloc] initWithUTF8String:managerStr];
            managerInputString = [managerInputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"Input was %@", managerInputString);
            if ([managerInputString intValue] == 1) {
                [kitchen setDelegate:manager];
            } else if ([managerInputString intValue] == 2) {
                [kitchen setDelegate:friendlyManager];
            } else if ([managerInputString intValue] == 3) {
                // no manager.
            }
            
            
            Pizza *pizza = [[Pizza alloc] initWithPizzaSize:pizzaSize withToppings:toppings];
        }
    }
    return 0;
}
