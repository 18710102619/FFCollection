//
//  NSObject+JobSafe.m
//  Pods
//
//  Created by 张玲玉 on 2017/2/22.
//
//

#import "NSObject+JobSafe.h"

@implementation NSObject (JobSafe)

- (id)job_valueForKey:(NSString *)key
{
    if (key) {
        return [self valueForKey:key];
    }
    return nil;
}

- (void)job_setValue:(id)value forKey:(NSString *)key
{
    if (value && key) {
        [self setValue:value forKey:key];
    }
}

- (void)job_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    if (observer || keyPath) {
        return;
    }
    @try {
        [self addObserver:observer forKeyPath:keyPath options:options context:context];
    }
    @catch (NSException *exception) {
        NSLog(@"job_addObserver ex: %@", [exception callStackSymbols]);
    }
}

- (void)job_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    if (!observer || !keyPath.length) {
        return;
    }
    @try {
        [self removeObserver:observer forKeyPath:keyPath];
    }
    @catch (NSException *exception) {
        NSLog(@"job_RemoveObserver ex: %@", [exception callStackSymbols]);
    }
}

- (id)job_objectAtIndex:(NSUInteger)index
{
    if ([self isKindOfClass:[NSArray class]]) {
        NSArray *array=(NSArray *)self;
        if (index < array.count) {
            return [array objectAtIndex:index];
        }
    }
    return nil;
}

- (void)job_addObject:(id)anObject
{
    if ([self isKindOfClass:[NSMutableArray class]]) {
        NSMutableArray *array=(NSMutableArray *)self;
        if (anObject) {
            [array addObject:anObject];
        }
    }
}

- (id)job_objectForKey:(NSString *)aKey
{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic=(NSDictionary *)self;
        return [dic objectForKey:aKey];
    }
    return nil;
}

- (void)job_setObject:(id)anObject forKey:(id)aKey
{
    if (anObject && aKey) {
        if ([self isKindOfClass:[NSMutableDictionary class]]) {
            NSMutableDictionary *dic=(NSMutableDictionary *)self;
            [dic setObject:anObject forKey:aKey];
        }
    }
}

- (NSString *)job_stringForKey:(NSString *)key
{
    id value=[self job_objectForKey:key];
    if (value==nil) {
        return @"";
    }
    else {
        return [NSString stringWithFormat:@"%@", value];
    }
}

- (void)job_insertString:(NSString *)aString atIndex:(NSUInteger)loc
{
    if ([self isKindOfClass:[NSMutableString class]]) {
        NSMutableString *str=(NSMutableString *)self;
        if (loc<str.length) {
            [str insertString:aString atIndex:loc];
        }
    }
}

- (NSString *)job_getUrlString:(NSString *)url
{
    if ([url isKindOfClass:[NSString class]] && url.length>0) {
        NSString *prefix = [url substringToIndex:2];
        if ([prefix isEqualToString:@"//"]) {
            NSMutableString *mUrl=[NSMutableString stringWithString:url];
            [mUrl job_insertString:@"https:" atIndex:0];
            return mUrl;
        }
    }
    return url;
}

- (NSString *)job_substringWithRange:(NSRange)range
{
    if ([self isKindOfClass:[NSString class]]) {
        NSString *str=(NSString *)self;
        if (range.location+range.length<=str.length) {
            return [str substringWithRange:range];
        }
    }
    return nil;
}

@end
