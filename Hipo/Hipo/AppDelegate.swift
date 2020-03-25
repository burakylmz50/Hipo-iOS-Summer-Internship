//
//  AppDelegate.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 14.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: HomePageViewController())
        
        return true
    }
    
}

