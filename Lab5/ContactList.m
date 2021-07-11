#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _contacts = [NSMutableArray new];
        [self createSampleContacts];
    }
    return self;
}

- (void) addContact: (Contact *)newContact {
    NSInteger id = (NSInteger) [_contacts count];
    [_contacts addObject:newContact];
    [newContact setId:id];
}

- (void) createSampleContacts {
    Contact *newSampleContact = [[Contact alloc] initWithName:@"Cat" andEmail:@"cat@gmail.com"];
    [self addContact:newSampleContact];
}

- (void) showContacts {
    for (id contact in _contacts) {
        NSLog(@"\n# %@ (%@)", [contact name], [contact email]);
    }
}

@end
