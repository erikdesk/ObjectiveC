// https://stackoverflow.com/questions/5594116/how-to-round-off-float-values

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box1 = [[Box alloc] initWithHeight:2 andWidth:3 andLength:4];
        Box *box2 = [[Box alloc] initWithHeight:1 andWidth:1.5 andLength:0.8];
        
        NSLog(@"box1 volume = %.1f\n", [box1 volume]);
        NSLog(@"box2 volume = %.1f\n", [box2 volume]);
        NSLog(@"Can fit %dx box2s into box1.\n", [box1 fitWithBox:box2]);
        NSLog(@"Can fit %dx box1s into box2.\n", [box2 fitWithBox:box1]);
    }
    return 0;
}
