//
//  NKD_Html_Parse.m
//  Naked Apartments submit
//
//  Created by c on 3/20/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKD_Html_Parse.h"
#import "NKD_Thumbnail_Grabber.h"

@implementation NKD_Html_Parse{
    NSMutableDictionary *_itemData;
    NSMutableDictionary *_attributesByElement;
    NSMutableString *_elementString;
    NSMutableData *_responseData;
    NSData *_htmlData;
}


@synthesize elementArray;


-(NSDictionary *)itemData{
    return [_itemData copy];
}

- (id) loadHtmlByURL: (NSString *)urlString{
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    
    NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc] initWithURL:url];
    
   _nakedURLConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];

    _allItemsFound = [[NSMutableArray alloc] init];
    _allItemsFound_Geo = [[NSMutableArray alloc] init];
    
    
    return self;
    
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {

    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {

    return cachedResponse;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    elementArray = [[NSMutableArray alloc] init];
    
    TFHpple *nakedHtmlParser = [TFHpple hppleWithData:_responseData isXML:NO];
    NSString *queryStringinfo = @"//div[@class='listing-row listing-row-standard clearfix']/div/img";
    NSString *queryString = @"//div[@class='listing-row listing-row-standard clearfix']";
    NSArray *htmlNodes_infoAndImage = [nakedHtmlParser searchWithXPathQuery:queryStringinfo];
    NSArray *htmlNodes_Geo = [nakedHtmlParser searchWithXPathQuery:queryString];
    
    //NSMutableArray *foundElements = [[NSMutableArray alloc] initWithCapacity:0];
   
    
    for (TFHppleElement * elements in htmlNodes_infoAndImage) {
        NSMutableDictionary *html_Element = [[NSMutableDictionary alloc] init];
        
        NSLog(@"%@",elements);
        
        
        if (nil != [elements objectForKey:@"title"]) {
            [html_Element setObject:[elements objectForKey:@"title"] forKey:@"info"];
            
            // NSLog(@"apartment description is %@",[html_Element objectForKey:@"info"]);
        }
        
        if (nil != [elements objectForKey:@"src"]) {
            [html_Element setObject:[elements objectForKey:@"src"] forKey:@"link"];
            //NSLog(@"apartment image is %@",[html_Element objectForKey:@"link"]);
            NKD_Thumbnail_Grabber *thumbNail = [[NKD_Thumbnail_Grabber alloc] init];
            [thumbNail requestImage:[elements objectForKey:@"src"]];
            [html_Element setObject:thumbNail forKey:@"thumbnail"];
        }
        [_allItemsFound addObject:html_Element];
    }

    
    
    
    for (TFHppleElement * elements in htmlNodes_Geo) {
        NSMutableDictionary *html_Element = [[NSMutableDictionary alloc] init];
       
      // NSLog(@"element %i is %@",elementInt, elements);
       
       // [html_Element setObject:[[elements objectForKey:@"nodeChildArray"] objectAtIndex:0] forKey:@"info"];
        /*
        if (nil != [elements objectForKey:@"nodeChildArray"]) {
            [html_Element setObject:[elements objectForKey:@"nodeChildArray"] forKey:@"info"];
           
           // NSLog(@"apartment description is %@",[html_Element objectForKey:@"info"]);
        }
         */
       /*
        if (nil != [elements objectForKey:@"src"]) {
            [html_Element setObject:[elements objectForKey:@"src"] forKey:@"link"];
           // NSLog(@"apartment image is %@",[html_Element objectForKey:@"link"]);
            NKD_Thumbnail_Grabber *thumbNail = [[NKD_Thumbnail_Grabber alloc] init];
            [thumbNail requestImage:[elements objectForKey:@"src"]];
            [html_Element setObject:thumbNail forKey:@"thumbnail"];
        }
        
        if (nil != [elements objectForKey:@"src"]) {
        //  [html_Element setObject:[childElement objectForKey:@"href"] forKey:@"link"];
        NSLog(@"link is prable is ");
        }
        
        for (TFHppleElement *childElement in [elements children]) {
        NSLog(@"child is %@",childElement);
        if (nil != [childElement objectForKey:@"src"]) {
        [html_Element setObject:[childElement objectForKey:@"href"] forKey:@"link"];
        NSLog(@"link is prable is %@",[html_Element objectForKey:@"link"]);
        }
        }
        */
        if (nil != [elements objectForKey:@"data-latitude"]) {
            [html_Element setObject:[elements objectForKey:@"data-latitude"] forKey:@"latitude"];
          NSLog(@"latitude is %@",[html_Element objectForKey:@"latitude"]);
        }
        if (nil != [elements objectForKey:@"data-longitude"]) {
            [html_Element setObject:[elements objectForKey:@"data-longitude"] forKey:@"longitude"];
         NSLog(@"longitude is %@",[html_Element objectForKey:@"longitude"]);
        }
        
        
       
        
       
        
        
        
         [_allItemsFound_Geo addObject:html_Element];
    }
   
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"error with request: %@",error);
}




@end
