@interface SBAppSwitcherPageView : UIView
@end

%hook SBAppSwitcherSettings
- (NSUInteger)numberOfSnapshotsToCacheInSwitcher {
return 100;
}
- (NSUInteger)numberOfSnapshotsToAlwaysKeepAround {
return 100;
}
%end

%hook SBAppSwitcherPageView
- (void)_updateCornerRadius {
    CAShapeLayer * maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.bounds byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii: (CGSize){40.0, 40.}].CGPath;

    self.layer.mask = maskLayer;
}
%end
