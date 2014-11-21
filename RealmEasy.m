//
//  RealmEasy.m
//  Realm Easy
//
//  Created by Bo Frese on 15/11-14.
//  Copyright (c) 2014 I-Con.dk. All rights reserved.
//

#import "RealmEasy.h"


@interface RLMRealm () // Access private properties of Realm !
-(BOOL)inWriteTransaction;
@end


@interface RealmEasy () // PRIVATE PROPERTIES 
@property (nonatomic, copy) NSString *inMemoryIdentifier;
@end

@implementation RealmEasy
#pragma mark - PUBLIC CLASS METHODS

// SINGLETON. Always use the same RealmEasy instance !
+ (RealmEasy *)sharedInstance {
    static RealmEasy *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[RealmEasy alloc] init ];
    });
    return _sharedInstance;
}

+(RLMRealm *)realm {
    RealmEasy *easy = [RealmEasy sharedInstance ];
    if ( easy.inMemoryIdentifier ) {
        return [ RLMRealm inMemoryRealmWithIdentifier:easy.inMemoryIdentifier];
    }
    return [ RLMRealm defaultRealm];
}

+(void)useInMemoryRealm:(NSString *)identifier
{
    RealmEasy *easy = [RealmEasy sharedInstance ];
    easy.inMemoryIdentifier = identifier;
}

+(void)useDefaultRealm
{
    RealmEasy *easy = [RealmEasy sharedInstance ];
    easy.inMemoryIdentifier = nil;
}

+(void)transaction:(void(^)(void))block {

    if ( [RealmEasy isInTransaction ] ) {
        block();
    } else {
        [[RealmEasy realm] transactionWithBlock:block ];
    }
}

+(BOOL)isInTransaction
{
    return [[RealmEasy realm] inWriteTransaction ];
}

@end
