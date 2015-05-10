# TouchID
Touch ID Fingerprint identification 指纹识别


## Usage


```
#import "TouchID.h"

	[TouchID validateTouchIDReason:@"Touch ID" fallbackTitle:@"Enter Passcode" callback:^(BOOL success, NSError *error) {
		
	}];

```