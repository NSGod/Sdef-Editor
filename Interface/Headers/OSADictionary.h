/*
 *     Generated by class-dump 3.1.1.
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2006 by Steve Nygard.
 */

@class OSADictionaryPrivate;

@interface OSADictionary : NSObject
{
    NSString *_name;
    OSADictionaryPrivate *_private;
}

+ (id)chooseDictionaries;
+ (BOOL)chooseDictionary;
- (id)initWithData:(id)fp8 error:(id *)fp12;
- (id)initWithContentsOfURL:(id)fp8 error:(id *)fp12;
- (id)initWithContentsOfFile:(id)fp8 error:(id *)fp12;
- (void)dealloc;
- (id)name;
- (void)setName:(id)fp8;
- (id)data;
- (void)setData:(id)fp8;
- (id)html;
- (void)setHtml:(id)fp8;
- (BOOL)writeToFile:(id)fp8 atomically:(BOOL)fp12;
- (BOOL)writeToURL:(id)fp8 atomically:(BOOL)fp12;

@end

