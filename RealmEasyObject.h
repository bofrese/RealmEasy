//
//  RealmEasyObject.h
//  Realm Easy
//
//  Created by Bo Frese on 21/11-14.
//  Copyright (c) 2014 I-Con.dk. All rights reserved.
//

#import "RealmEasy.h"

@interface RealmEasyObject : RLMObject

+(instancetype)createInDefaultRealmWithObject:(id)object ;
+(instancetype)createOrUpdateInDefaultRealmWithObject:(id)object ;
+ (RLMResults *)allObjects ;
+ (RLMResults *)objectsWithPredicate:(NSPredicate *)predicate ;
+ (instancetype)objectForPrimaryKey:(id)primaryKey ;

@end
