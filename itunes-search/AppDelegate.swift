//
//  AppDelegate.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        navigateToStartViewController()
        return true
    }
    
    private func navigateToStartViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let startViewController = SearchResultViewController(searchResultViewModel: SearchResultsViewModel())
        let navigationController = UINavigationController(rootViewController: startViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
