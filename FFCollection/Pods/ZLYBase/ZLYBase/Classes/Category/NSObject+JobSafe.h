//
//  NSObject+JobSafe.h
//  Pods
//
//  Created by 张玲玉 on 2017/2/22.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (JobSafe)

- (id _Nullable )job_valueForKey:(NSString *_Nullable)key;

- (void)job_setValue:(id _Nullable )value forKey:(NSString *_Nullable)key;

- (void)job_addObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath options:(NSKeyValueObservingOptions)options context:(void *_Nullable)context;

- (void)job_removeObserver:(NSObject *_Nullable)observer forKeyPath:(NSString *_Nullable)keyPath;

- (id _Nullable )job_objectAtIndex:(NSUInteger)index;

- (void)job_addObject:(id _Nullable )anObject;

- (id _Nullable )job_objectForKey:(NSString *_Nullable)aKey;

- (void)job_setObject:(id _Nullable )anObject forKey:(id _Nullable )aKey;

- (NSString *_Nullable)job_stringForKey:(NSString *_Nullable)key;

- (void)job_insertString:(NSString *_Nullable)aString atIndex:(NSUInteger)loc;

- (NSString *_Nullable)job_getUrlString:(NSString *_Nullable)url;

- (NSString *_Nullable)job_substringWithRange:(NSRange)range;

@end




