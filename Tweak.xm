@interface SBBacklightController
- (_Bool)shouldTurnOnScreenForBacklightSource:(int)arg1;
@end

@interface SBMediaController
- (_Bool)isRingerMuted;
+ (id)sharedInstance;
@end

static _Bool ringerIsMuted = [(SBMediaController *)[%c(SBMediaController) sharedInstance] isRingerMuted];

%hook SBBacklightController

- (_Bool)shouldTurnOnScreenForBacklightSource:(int)arg1 {
	_Bool ringerMuted = [(SBMediaController *)[%c(SBMediaController) sharedInstance] isRingerMuted];
	if (ringerIsMuted != ringerMuted) {
		ringerIsMuted = ringerMuted;
		return false;
	} else {
		return %orig;
	}
}

%end