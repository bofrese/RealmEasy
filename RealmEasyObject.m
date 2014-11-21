//
//  RealmEasyObject.m
//  Realm Easy
//
//  Created by Bo Frese on 21/11-14.
//

#import "RealmEasyObject.h"
//#import "Constants.h"

@implementation RealmEasyObject

+(instancetype)createInDefaultRealmWithObject:(id)object {
    return [ super createInRealm:RealmEasy.realm withObject:object ];
}

+(instancetype)createOrUpdateInDefaultRealmWithObject:(id)object {
    return [ super createOrUpdateInRealm:RealmEasy.realm withObject:object ];
}

+ (RLMResults *)allObjects {
    return [ super allObjectsInRealm:RealmEasy.realm ];
}

+ (RLMResults *)objectsWithPredicate:(NSPredicate *)predicate {
    return [ super objectsInRealm:RealmEasy.realm withPredicate:predicate ];
}

+ (instancetype)objectForPrimaryKey:(id)primaryKey {
    return [ super objectInRealm:RealmEasy.realm forPrimaryKey:primaryKey ];
}

@end
