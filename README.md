RealmEasy
=========

Realm is already a fantastic product, that makes persistence in iOS so much easier.
RealmEasy tries to make this even easier ...



Why RealmEasy?
----------------

I created RealmEasy to solve two problems.

- As of Realm 0.87 it is no longer possible to set the default Realm to be an inMemoryRealm. 
  This means that you would have to either use the real default.realm for your unit testing, 
  or pass the realm around all over your code (no longer use 'defaultRealm').

- I often found myself writing model object methods that would sometimes be called as part of some other transaction, 
  and sometimes they would be called outside any transaction. 
  So I either had to wrap all these calls in beginTransacion boilerplate code, or pass some information about wether or not I was already in a transaction.


Getting and setting your default realm
------------------------------

Simply call 

        RLMRealm realm* = RealmEasy.realm;

instead of 

        RLMRealm realm* = RLMRealm.defaultRealm;

And to use an in memory realm call...

        [ RealmEasy useInMemoryRealm:@"UnitTest" ];

And to make sure your RLMObject's use the right default Realm, simply inherit from RealmEasyObject instead of RLMObject 

    @interface MyModelObject : RealmEasyObject 

instead of 

    @interface MyModelObject : RLMObject 


Creating a new transation - or use the current transaction
------------------------------------------------------------

You can always call RealmEasy transaction, even if you are already in a transaction!

        [ RealmEasy transaction:^{
            [RealmEasy.realm addObject:account ];
        } ];



Use in UnitTest
---------------

Simply add something like this to your `application: didFinishLaunchingWithOptions:` in your AppDelegate 

    #if TESTING
        [ RealmEasy useInMemoryRealm:@"UnitTest" ];
    #endif


This test actually works...

    - (void)testRealmEasy
    {
        Account *account = [[ Account alloc] init ];
        account.username = @"realmy";
        account.password = @"RealySecret";
        account.name     = @"My Realm Name";
        [ RealmEasy transaction:^{
            [RealmEasy.realm addObject:account ];
        } ];
        
        [ RealmEasy transaction:^{
            Account *a1 = [ Account findByUsermame:@"realmy" ];
            a1.name = @"Another Name";
            
            [ RealmEasy transaction:^{
                Account *a2 = [ Account findByUsermame:@"realmy" ];
                a2.name = @"Yet Another Name";
            } ];
        } ];
        Account *a3 = [ Account findByUsermame:@"realmy" ];
        
        XCTAssertEqualObjects(a3.name, @"Yet Another Name" );
    }



Status
-----------

The current status of RealmEasy is : "It works for me...".
Any ideas, fixes, additions are welcome. Please just open a GitHub issue.



