#import <Foundation/Foundation.h>
#import "Greeter.h"
#import "FriendlyGreetingDecider.h"
#import "FoodTruck.h"
#import "Cook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Greeter *greeter = [Greeter new];
        FriendlyGreetingDecider *friendlyGreetingDecider = [FriendlyGreetingDecider new];
        greeter.delegate = friendlyGreetingDecider;
        [greeter sayHello];
        
        FoodTruck *truckA = [[FoodTruck alloc] initWithName:@"Take a Bao" andFoodType:@"bao"];
        FoodTruck *truckB = [[FoodTruck alloc] initWithName:@"Tim Shortons" andFoodType:@"shortbread"];
        
        // create instances of your delegate class
        Cook *cook = [Cook new];
        // set truckA and truckB's delegate to your new instance.
        truckA.delegate = cook;
        truckB.delegate = cook;
        
        [truckA serve:10];
        [truckB serve:5];
        
        [truckA cashOut];
        [truckB cashOut];
    }
    return 0;
}
