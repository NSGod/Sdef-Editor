//
//  SdefParser.m
//  SDef Editor
//
//  Created by Grayfox on 06/01/05.
//  Copyright 2005 Shadow Lab. All rights reserved.
//

#import "SdefParser.h"
#import "ShadowMacros.h"
#import "SdefDictionary.h"

@implementation SdefParser

- (id)init {
  if (self = [super init]) {
    
  }
  return self;
}

- (void)dealloc {
  [sd_document release];
  [super dealloc];
}

- (SdefDictionary *)document {
  return sd_document;
}

- (BOOL)parseData:(NSData *)document {
  if (sd_document) {
    [sd_document release];
    sd_document = nil;
  }
  NSXMLParser *parser = [[NSXMLParser alloc] initWithData:document];
  [parser setShouldResolveExternalEntities:YES];
  [parser setDelegate:self];
  BOOL result = [parser parse];
  [parser release];
  return result;
}

#pragma mark Document Handling
// sent when the parser begins parsing of the document.
- (void)parserDidStartDocument:(NSXMLParser *)parser {
  if (sd_document) {
    [sd_document release];
  }
  sd_document = [(SdefObject *)[SdefDictionary alloc] init];
}
// sent when the parser has completed parsing. If this is encountered, the parse was successful.
- (void)parserDidEndDocument:(NSXMLParser *)parser {
}

#pragma mark DTD Handling
// DTD handling methods for various declarations.
- (void)parser:(NSXMLParser *)parser foundNotationDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID {
  ShadowTrace();
}

- (void)parser:(NSXMLParser *)parser foundUnparsedEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID notationName:(NSString *)notationName {
  ShadowTrace();
}

- (void)parser:(NSXMLParser *)parser foundAttributeDeclarationWithName:(NSString *)attributeName forElement:(NSString *)elementName type:(NSString *)type defaultValue:(NSString *)defaultValue {
  ShadowTrace();
}

- (void)parser:(NSXMLParser *)parser foundElementDeclarationWithName:(NSString *)elementName model:(NSString *)model {
  ShadowTrace();
}

- (void)parser:(NSXMLParser *)parser foundInternalEntityDeclarationWithName:(NSString *)name value:(NSString *)value {
  ShadowTrace();
}

- (void)parser:(NSXMLParser *)parser foundExternalEntityDeclarationWithName:(NSString *)name publicID:(NSString *)publicID systemID:(NSString *)systemID {
  ShadowTrace();
}

#pragma mark Element Handling
// sent when the parser finds an element start tag.
// In the case of the cvslog tag, the following is what the delegate receives:
//   elementName == cvslog, namespaceURI == http://xml.apple.com/cvslog, qualifiedName == cvslog
// In the case of the radar tag, the following is what's passed in:
//    elementName == radar, namespaceURI == http://xml.apple.com/radar, qualifiedName == radar:radar
// If namespace processing >isn't< on, the xmlns:radar="http://xml.apple.com/radar" is returned as an attribute pair, the elementName is 'radar:radar' and there is no qualifiedName.
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
  if ([elementName isEqualToString:@"dictionary"]) {
    [sd_document setAttributes:attributeDict];
    [parser setDelegate:sd_document];
  }
}

// sent when an end tag is encountered. The various parameters are supplied as above.
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
  ShadowTrace();
}

#pragma mark Mapping Handling
// sent when the parser first sees a namespace attribute.
// In the case of the cvslog tag, before the didStartElement:, you'd get one of these with prefix == @"" and namespaceURI == @"http://xml.apple.com/cvslog" (i.e. the default namespace)
// In the case of the radar:radar tag, before the didStartElement: you'd get one of these with prefix == @"radar" and namespaceURI == @"http://xml.apple.com/radar"
- (void)parser:(NSXMLParser *)parser didStartMappingPrefix:(NSString *)prefix toURI:(NSString *)namespaceURI {
  ShadowTrace();
}

// sent when the namespace prefix in question goes out of scope.
- (void)parser:(NSXMLParser *)parser didEndMappingPrefix:(NSString *)prefix {
  ShadowTrace();
}

#pragma mark Other Objects Handling
// This returns the string of the characters encountered thus far. You may not necessarily get the longest character run.
// The parser reserves the right to hand these to the delegate as potentially many calls in a row to -parser:foundCharacters:
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
  ShadowTrace();
}

// The parser reports ignorable whitespace in the same way as characters it's found.
- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString {
  ShadowTrace();
}

// The parser reports a processing instruction to you using this method.
// In the case above, target == @"xml-stylesheet" and data == @"type='text/css' href='cvslog.css'"
- (void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data {
  ShadowTrace();
}

// A comment (Text in a <!-- --> block) is reported to the delegate as a single string
- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment {
  if (![comment isEqualToString:SdefEditorComment()]) {
    [sd_document addComment:[comment stringByUnescapingEntities:nil]];
  }
}

// this reports a CDATA block to the delegate as an NSData.
- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
  ShadowTrace();
}

// this gives the delegate an opportunity to resolve an external entity itself and reply with the resulting data.
- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID {
  ShadowTrace();
}

// ...and this reports a fatal error to the delegate. The parser will stop parsing.
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
  DLog(@"Error: %@, %@", parseError, [parseError userInfo]);
}

// If validation is on, this will report a fatal validation error to the delegate. The parser will stop parsing.
- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError {
  ShadowTrace();
}

@end
