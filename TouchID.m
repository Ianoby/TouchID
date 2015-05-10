//
//  TouchID.m
//  ios
//
//  Created by coku on 15/5/5.
//  Copyright (c) 2015年 lantouzi. All rights reserved.
//

#import "TouchID.h"


NSString *const kTouchIDErrorDomain = @"TouchIDAuthenticationDomain";

@implementation TouchID

+ (BOOL)canUseTouchID:(NSError **)error
{
	if (NSClassFromString(@"LAContext") != nil) {
		LAContext *context = [[LAContext alloc] init];
		return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:error];
	} else {
		return NO;
	}
}

+ (void)validateTouchIDReason:(NSString *)reason fallbackTitle:(NSString *)fallbackTitle callback:(TouchIDCallback)callback
{
	
	NSError *error = nil;
	if (![self canUseTouchID:&error]) {
		callback(NO, error);
		return;
	}
	
	LAContext *context = [[LAContext alloc] init];
	context.localizedFallbackTitle = fallbackTitle;
	[context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reason reply:^(BOOL success, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			if (callback) {
				if (success) {
					callback(YES, error);
				} else {
					callback(NO, error);
				}
			}
		});
	}];
}


@end
