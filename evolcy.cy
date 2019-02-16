elapppath = [NSBundle mainBundle].bundlePath;
elwindow = function(){
    return [UIApplication sharedApplication].keyWindow;
};
elcurrentvc = function(){
    var topViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (true) {
        if (topViewController.presentedViewController) {
            topViewController = topViewController.presentedViewController;
        } else if ([topViewController isKindOfClass:[UINavigationController class]] && [topViewController topViewController]) {
            topViewController = [topViewController topViewController];
        }else if ([topViewController isKindOfClass:[UITabBarController class]]) {
            topViewController = topViewController.selectedViewController;
        } else {
            break;
        }
    }
    return topViewController;
};

