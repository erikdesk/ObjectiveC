#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *menuString = [NSString stringWithFormat:@"\n%@%@%@%@",
                                @"What would you like to do next?\n",
                                @"new - Create a new contact\n",
                                @"list - List all contacts\n",
                                @"quit - Exit Application\n"];
        
        InputCollector *inputCollector = [InputCollector new];
        ContactList *contactList = [ContactList new];
        
        while (YES) {
            NSString *inputString = [inputCollector inputForPrompt:menuString];
            
            if ([inputString isEqual: @"new"]) {
                NSString *inputName = [inputCollector inputForPrompt:@"Name:"];
                NSString *inputEmail = [inputCollector inputForPrompt:@"E-mail:"];
                Contact *newContact = [[Contact alloc] initWithName:inputName andEmail:inputEmail];
                [contactList addContact:newContact];
                continue;
            } else if ([inputString isEqual: @"list"]) {
                [contactList showContacts];
                continue;
            } else if ([inputString isEqual: @"quit"]) {
                break;
            } else {
                NSLog(@"\nInvalid command!");
                continue;
            }
        }
    }
    return 0;
}
