//#import <Foundation/Foundation.h>
////#import "Person.h" // effectively just copy-and-paste. hashtag pre-processor.
//
//NSString *getUserInput(int maxLength, NSString *prompt) {
//    if (maxLength < 1) {
//        maxLength = 255;
//    }
//    NSLog(@"%@", prompt);
//    
//    char inputChars[maxLength];
//    char *result = fgets(inputChars, maxLength, stdin); // returns pointer to result.
//
//    if (result != NULL) {
//        NSString *string = [NSString stringWithUTF8String: inputChars];
//        NSCharacterSet *whiteSpaces = [NSCharacterSet: whiteSpaceAndNewLineCharacterSet]
//        return [string stringByTrimmingCharactersInSet: whiteSpaces]
//    }
//}
//
//// on TERMINAL read manual.
//// man fgets
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        NSString *user = getUserInput(255, @"Enter your name");
//        NSLog(@"%@", user);
//    }
//    return 0;
//}
//
//// MARK: NOTES 2
//
////int main(int argc, const char * argv[]) {
////    @autoreleasepool {
////
////        Person *p1 = [[Person alloc] initWithName: @"Erik" andAge: 20]; // allocate memory and initialize.
////        [Person printHello]; // call static method Person.printHello
////        NSLog(@"%@, %d", [p1 name], [p1 age]);
////        //[p1 setName: @"Nick"]
////    }
////    return 0;
////}
//
//// MARK: NOTES 1
//
////#import <Foundation/Foundation.h>
////
////int main(int argc, const char * argv[]) {
////    @autoreleasepool {
////
////        // MARK: variables
////        char c = 'A';
////        short s = 2;
////        int i = 4;
////        long l = 48;
////        long long ll = 8;
////        float f = 4.0f;
////        double d = 8.0; // no need f
////        BOOL b = YES;
////
////        // MARK: constants
////        const int x = 10;
////
////        // MARK: print
////        NSLog(@"sizeof(BOOL) = %lu byte %d %s %f", sizeof(BOOL), 2, "hello", 3.14f);
////
////        // MARK: if-else
////        if (i > 5 && i <= 20) {
////
////        } else if (i == 0) {
////
////        } else {
////
////        }
////
////        // MARK: for
////        for (int x = 0; x < 3; x++) {
////
////        }
////
////        // MARK: while
////        int y = 0;
////        while (y < 3) {
////            y++;
////        }
////
////        // MARK: do-while, always iterates once.
////        //y = 0
////        //do {
////        //    break;
////        //    continue;
////        //} while(y < 3);
////
////        // MARK: C-string
////        char *str = "Hello";
////        strlen(str);
////
////        // MARK: Obj-C string
////        NSString *objcString = @"Hello";
////
////        // MARK: pointer
////        int p = 10;
////        int *q = &p;
////        printf("q = %p\n", q);
////        printf("&p = %p\n", &p);
////        printf("*q = %d\n", *q); // dereferencing (content of)
////        *q = 12;
////        printf("p = %d\n", p);
////
////        NSLog(@"Hello, World!");
////
////        // MARK: pointer to int*
////        int **r;
////
////        // MARK: array
////        int *arr = {1, 2, 3};
////
////
////    }
////    return 0;
////}
