//
//  NKD_Thumbnail_Grabber.m
//  Naked Apartments submit
//
//  Created by c on 3/21/14.
//  Copyright (c) 2014 Craig Dolan. All rights reserved.
//

#import "NKD_Thumbnail_Grabber.h"

@implementation NKD_Thumbnail_Grabber{
    
   NSURLConnection *_nakedURL_Connection;
    NSMutableData *_image_URL_Data;
}
-(void)requestImage:(NSString *)link{
    
    NSURL *url = [NSURL URLWithString:link];
    
   // NSLog(@"link is %@",link);
    
    NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    
    _nakedURL_Connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    
}


#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    _image_URL_Data = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [_image_URL_Data appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    self.app_Thumbnail = [UIImage imageWithData:_image_URL_Data];
}
@end
