//
//  AppDelegate.swift
//  BaseProject
//
//  Created by Fabio Angelilli on 07/06/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
    
        let navigationController = UINavigationController.init(rootViewController: HomeViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
}
