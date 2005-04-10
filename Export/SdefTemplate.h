//
//  SdefTemplate.h
//  Sdef Editor
//
//  Created by Grayfox on 28/03/05.
//  Copyright 2005 Shadow Lab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum {
  kSdefTemplateTOCNone			= 0,
  kSdefTemplateTOCIndex			= 1 << 0,
  kSdefTemplateTOCDictionary	= 1 << 1,
  kSdefTemplateTOCExternal		= 1 << 2,
  kSdefTemplateTOCRequired		= 1 << 3
};

enum {
  kSdefTemplateCSSNone		= 0,
  kSdefTemplateCSSInline	= 1 << 0,
  kSdefTemplateCSSExternal	= 1 << 1
};

extern NSString * const SdtplTocDefinitionKey;
extern NSString * const SdtplIndexDefinitionKey;
extern NSString * const SdtplDictionaryDefinitionKey;
extern NSString * const SdtplSuitesDefinitionKey;
extern NSString * const SdtplClassesDefinitionKey;
extern NSString * const SdtplCommandsDefinitionKey;
extern NSString * const SdtplEventsDefinitionKey;

extern NSString * const SdefInvalidTemplateException;
extern NSString * const SdefTemplateDidChangeNotification;

@class SKTemplate;
@interface SdefTemplate : NSObject {
  NSString *sd_path;
  NSString *sd_name;
  struct _tp_flags {
    unsigned int css:4;
    unsigned int toc:4;
    unsigned int html:1;
    unsigned int :7;
  } tp_flags;
  NSArray *sd_styles;
  NSDictionary *sd_selectedStyle; /* Weak */
  NSMutableDictionary *sd_infos, *sd_tpls, *sd_def;
}

+ (NSDictionary *)findAllTemplates;

- (NSString *)path;
- (void)setPath:(NSString *)path;

- (NSString *)displayName;
- (NSString *)extension;
- (NSString *)menuName;

- (NSDictionary *)formats;
- (NSDictionary *)templates;
- (NSDictionary *)definition;

- (NSArray *)styles;
- (NSDictionary *)selectedStyle;
- (void)setSelectedStyle:(NSDictionary *)style;

- (BOOL)isHtml;

- (BOOL)indexToc;
- (BOOL)dictionaryToc;
- (BOOL)externalToc;
- (BOOL)requiredToc;

- (unsigned)toc;
- (void)setToc:(unsigned)toc;

- (unsigned)css;
- (void)setCss:(unsigned)css;

@end
