#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject

@property (nonatomic) NSMutableArray *contacts;

- (void) addContact: (Contact *)newContact;
- (void) showContacts;

@end

NS_ASSUME_NONNULL_END
