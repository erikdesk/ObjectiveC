#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject

@property (nonatomic) NSInteger id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *email;

- (instancetype)initWithName: (NSString *) name andEmail: (NSString *) email;

@end

NS_ASSUME_NONNULL_END
