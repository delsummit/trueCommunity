//
//  AppDelegate.swift
//  Crypto Boost
//
//  Created by Rostyslav Mukoida on 12/02/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
   // var mainTabBar = UITabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            let rootNavigationController = UINavigationController()
            rootNavigationController.viewControllers = [LoginViewController()]
        
           // let mainTabBar = MainTabBarController()
           // self.mainTabBar = mainTabBar
            
            //window.rootViewController = mainTabBar
            window.rootViewController = rootNavigationController
            window.makeKeyAndVisible()
        }
        
        UITextField.appearance().keyboardAppearance = .dark
        UITextView.appearance().keyboardAppearance = .dark
    
        return true
    }
    
    
}

