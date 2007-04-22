/*
 *  SdefSynonym.h
 *  Sdef Editor
 *
 *  Created by Rainbow Team.
 *  Copyright � 2006 - 2007 Shadow Lab. All rights reserved.
 */

#import "SdefLeaf.h"

/*
 <!-- SYNONYMS -->
 <!ELEMENT synonym ((%implementation;)?)>
 <!ATTLIST synonym
 name       %Term;          #IMPLIED
 code       %OSType;		 #IMPLIED
 hidden     %yorn;          #IMPLIED 
 >
 <!-- at least one of "name" and "code" is required. -->
 */

@class SdefImplementation;
@interface SdefSynonym : SdefLeaf <NSCopying, NSCoding> {
  NSString *sd_code;
  SdefImplementation *sd_impl; 
}

- (NSString *)code;
- (void)setCode:(NSString *)code;

- (SdefImplementation *)impl;
- (void)setImpl:(SdefImplementation *)anImpl;

@end
