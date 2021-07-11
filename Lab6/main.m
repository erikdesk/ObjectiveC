#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *dices = [NSMutableArray new];
        [dices addObject:[Dice new]];
        [dices addObject:[Dice new]];
        [dices addObject:[Dice new]];
        [dices addObject:[Dice new]];
        [dices addObject:[Dice new]];
        
        NSLog(@"%ld", [[dices objectAtIndex:0] currentValue]);
        NSLog(@"%ld", [[dices objectAtIndex:1] currentValue]);
        
        NSLog(@"⚀⚁⚂⚃⚄⚅");
    }
    return 0;
}
