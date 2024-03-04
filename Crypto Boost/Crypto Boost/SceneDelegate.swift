//
//  SceneDelegate.swift
//  Crypto Boost
//
//  Created by Rostyslav Mukoida on 04/03/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // like didFinishLaunchingWithOption in AppDelegate, setup root here
        // delete comment later
        
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        
        let rootNavigationController = UINavigationController()
        rootNavigationController.viewControllers = [LoginViewController()]

        window.rootViewController = rootNavigationController

        UITextField.appearance().keyboardAppearance = .dark
        UITextView.appearance().keyboardAppearance = .dark
        
        self.window = window
        window.makeKeyAndVisible()
    }

}

