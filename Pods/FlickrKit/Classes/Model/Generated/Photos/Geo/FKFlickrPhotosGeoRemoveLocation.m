//
//  FKFlickrPhotosGeoRemoveLocation.m
//  FlickrKit
//
//  Generated by FKAPIBuilder.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrPhotosGeoRemoveLocation.h" 

@implementation FKFlickrPhotosGeoRemoveLocation



- (BOOL) needsLogin {
    return YES;
}

- (BOOL) needsSigning {
    return YES;
}

- (FKPermission) requiredPerms {
    return 1;
}

- (NSString *) name {
    return @"flickr.photos.geo.removeLocation";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];
	if(!self.photo_id) {
		valid = NO;
		[errorDescription appendString:@"'photo_id', "];
	}

	if(error != NULL) {
		if(!valid) {	
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorDescription};
			*error = [NSError errorWithDomain:FKFlickrKitErrorDomain code:FKErrorInvalidArgs userInfo:userInfo];
		}
	}
    return valid;
}

- (NSDictionary *) args {
    NSMutableDictionary *args = [NSMutableDictionary dictionary];
	if(self.photo_id) {
		[args setValue:self.photo_id forKey:@"photo_id"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrPhotosGeoRemoveLocationError_PhotoNotFound:
			return @"Photo not found";
		case FKFlickrPhotosGeoRemoveLocationError_PhotoHasNoLocationInformation:
			return @"Photo has no location information";
		case FKFlickrPhotosGeoRemoveLocationError_SSLIsRequired:
			return @"SSL is required";
		case FKFlickrPhotosGeoRemoveLocationError_InvalidSignature:
			return @"Invalid signature";
		case FKFlickrPhotosGeoRemoveLocationError_MissingSignature:
			return @"Missing signature";
		case FKFlickrPhotosGeoRemoveLocationError_LoginFailedOrInvalidAuthToken:
			return @"Login failed / Invalid auth token";
		case FKFlickrPhotosGeoRemoveLocationError_UserNotLoggedInOrInsufficientPermissions:
			return @"User not logged in / Insufficient permissions";
		case FKFlickrPhotosGeoRemoveLocationError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrPhotosGeoRemoveLocationError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrPhotosGeoRemoveLocationError_WriteOperationFailed:
			return @"Write operation failed";
		case FKFlickrPhotosGeoRemoveLocationError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrPhotosGeoRemoveLocationError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrPhotosGeoRemoveLocationError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrPhotosGeoRemoveLocationError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrPhotosGeoRemoveLocationError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
