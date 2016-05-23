//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

// Objectives: Use NSPredicate to filter objects in an array. Practice accessing a nested collection.

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits; {
    
    // return an NSArray of all of the occurrences of the string @"apple" in the argument array 'fruits'.
    
    NSPredicate *applesFromFruit = [NSPredicate predicateWithFormat:@"self CONTAINS[cd] 'apple'"];
    NSArray *apples = [fruits filteredArrayUsingPredicate:applesFromFruit];
    
    return apples;
    // This is a pretty straightforward example of ways to utilize NSPredicate to iterate over an Array to pull out information WITHOUT utilizing a loop.
    
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    // First layer of database is static dictionary of "season" keys; each season key is bound to a mutable dictionary of "holiday" keys; each holiday key is bound to mutable array of "supplies" relevant to that holiday
    // database[season][holiday][supplies]
    
    NSArray *holidayKeys = [database[season] allKeys];
    
    return holidayKeys;
    // This method (& really most that follow) are all about subscripting the huge NSDictionary that is database.
    
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    // return a mutable array of all of the supplies for the submited holiday in the submitted season argument.
    
    return [[NSArray arrayWithArray:database [season][holiday]] mutableCopy];
    // Wanted to note that the test is requesting a NSMutableArray which is why adding the mutableCopy at the end was absolutely necessary. I also could have defined an Array & returned that, this was easier to me.
    
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    // Return whether or not the submitted "season" contains a key that matches the "holiday" argument.
    
    BOOL holidaySeason = [[database [season] allKeys] containsObject:holiday];
    // I was toying around with if & else statements here which is what I would normally do when the lab asks to "return whether or not something is true", however, I was able to apply all conditions on one line. This also taught me that I don't have to blatently define BOOL = 1 or BOOL = 0, instead this allows the system to determine whether it's truthy for falsy.
    
    return holidaySeason;
    
}

- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    //return whether or not the submitted "season" contains a key that matches the "holiday" argument
    
    BOOL supplies = [database[season][holiday] containsObject:supply];
    
    return supplies;
    
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    //create a new key-value pair in the submitted "season" key's sub-dictionary that uses the "holiday" as the key and sets up an empty mutable array as its value
    
    NSMutableArray *mute = [[NSMutableArray alloc] init];
    
    [database[season] setObject:mute forKey:holiday];
    // Straightforward way to utilize the setObject: forKey: method. It can be tricky if you don't subscipt the dictionary correctly which in this case looks like database[season].
    
    return database;
    
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database; {
    
    // insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
    
    [database [season][holiday] addObject:supply];
    // This was a continuation of the previous method, we setObject: as NSMutableArray so here we were able to apply NSString supply to that particular area of the database.
    
    return database;
    
}

@end