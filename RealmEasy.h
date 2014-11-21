//
//  RealmEasy.h
//  Realm Easy
//
//  Created by Bo Frese on 15/11-14.
//

#import <Realm.h>
#import "RealmEasyObject.h"

@interface RealmEasy : NSObject

+(RLMRealm *)realm ;
+(void)useInMemoryRealm:(NSString *)identifier;
+(void)useDefaultRealm;
+(void)transaction:(void(^)(void))block ;
+(BOOL)isInTransaction;
    
@end
