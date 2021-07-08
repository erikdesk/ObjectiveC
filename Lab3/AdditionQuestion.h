#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AdditionQuestion : NSObject

@property (nonatomic) NSString *question;
@property (nonatomic) NSInteger answer;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
