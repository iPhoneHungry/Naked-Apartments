//
//  NKD_Html_Parse.h
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NKD_Html_Element.h"
#import "TFHpple.h"

@interface NKD_Html_Parse : NSObject {
    
    NSMutableString *currentNodeContent;
    NSMutableArray  *elementArray;
    NSXMLParser     *parser;
    NKD_Html_Element     *currentHTMLElement;

}

@property (nonatomic,strong) NSURLConnection * nakedURLConnection;
@property (readonly, strong) NSMutableArray *elementArray;

@property (readonly) NSDictionary *itemData;

@property (nonatomic,strong) NSMutableArray* allItemsFound;

@property (nonatomic,strong) NSMutableArray* allItemsFound_Geo;

- (id) loadHtmlByURL: (NSString *)urlString;


@end
