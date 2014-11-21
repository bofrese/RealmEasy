//
//  RealmEasyObject.h
//  Realm Easy
//
//  Created by Bo Frese on 21/11-14.
//

#import "RealmEasy.h"

@interface RealmEasyObject : RLMObject

+(instancetype)createInDefaultRealmWithObject:(id)object ;
+(instancetype)createOrUpdateInDefaultRealmWithObject:(id)object ;
+(RLMResults *)allObjects ;
+(RLMResults *)objectsWithPredicate:(NSPredicate *)predicate ;
+(instancetype)objectForPrimaryKey:(id)primaryKey ;

@end
