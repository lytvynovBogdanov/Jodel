//
//  FKFlickrTestLogin.h
//  FlickrKit
//
//  Generated by FKAPIBuilder.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrAPIMethod.h"

typedef NS_ENUM(NSInteger, FKFlickrTestLoginError) {
	FKFlickrTestLoginError_SSLIsRequired = 95,		 /* SSL is required to access the Flickr API. */
	FKFlickrTestLoginError_InvalidSignature = 96,		 /* The passed signature was invalid. */
	FKFlickrTestLoginError_MissingSignature = 97,		 /* The call required signing but no signature was sent. */
	FKFlickrTestLoginError_LoginFailedOrInvalidAuthToken = 98,		 /* The login details or auth token passed were invalid. */
	FKFlickrTestLoginError_UserNotLoggedInOrInsufficientPermissions = 99,		 /* The method requires user authentication but the user was not logged in, or the authenticated method call did not have the required permissions. */
	FKFlickrTestLoginError_InvalidAPIKey = 100,		 /* The API key passed was not valid or has expired. */
	FKFlickrTestLoginError_ServiceCurrentlyUnavailable = 105,		 /* The requested service is temporarily unavailable. */
	FKFlickrTestLoginError_WriteOperationFailed = 106,		 /* The requested operation failed due to a temporary issue. */
	FKFlickrTestLoginError_FormatXXXNotFound = 111,		 /* The requested response format was not found. */
	FKFlickrTestLoginError_MethodXXXNotFound = 112,		 /* The requested method was not found. */
	FKFlickrTestLoginError_InvalidSOAPEnvelope = 114,		 /* The SOAP envelope send in the request could not be parsed. */
	FKFlickrTestLoginError_InvalidXMLRPCMethodCall = 115,		 /* The XML-RPC request document could not be parsed. */
	FKFlickrTestLoginError_BadURLFound = 116,		 /* One or more arguments contained a URL that has been used for abuse on Flickr. */

};

/*

A testing method which checks if the caller is logged in then returns their username.


Response:

<user id="12037949754@N01">
	<username>Bees</username> 
</user>


*/
@interface FKFlickrTestLogin : NSObject <FKFlickrAPIMethod>


@end
