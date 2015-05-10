//
//  TouchID.h
//  ios
//
//  Created by coku on 15/5/5.
//  Copyright (c) 2015年 lantouzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>


typedef void(^TouchIDCallback)(BOOL success, NSError *error);

@interface TouchID : NSObject

+ (BOOL)canUseTouchID:(NSError **)error;
+ (void)validateTouchIDReason:(NSString *)reason fallbackTitle:(NSString *)fallbackTitle callback:(TouchIDCallback)callback;

@end
