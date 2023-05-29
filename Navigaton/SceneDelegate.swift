//
//  SceneDelegate.swift
//  Navigation
//
//  Created by OlegZernyev on 17.05.2023.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let profileViewcontroller = LogInViewController()
        let profileNovigationViewController = UINavigationController(rootViewController: profileViewcontroller)
        profileNovigationViewController.tabBarItem.title = "Profile"
        profileNovigationViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        profileNovigationViewController.tabBarItem.imageInsets.bottom = 5
        profileNovigationViewController.tabBarItem.imageInsets.top = 5
        let feedViewController = FeedViewController()
        let feedNovigationViewController = UINavigationController(rootViewController: feedViewController)
        feedNovigationViewController.tabBarItem.title = "Feed"
        feedNovigationViewController.tabBarItem.image = UIImage(systemName: "newspaper.circle")
        feedNovigationViewController.tabBarItem.imageInsets.bottom = 5
        feedNovigationViewController.tabBarItem.imageInsets.top = 5
        
        let tabViewController = UITabBarController()
        tabViewController.viewControllers = [profileNovigationViewController, feedNovigationViewController]
        tabViewController.tabBar.backgroundColor = UIColor.gray
        tabViewController.tabBar.tintColor = UIColor.blue
        
        window.rootViewController =  tabViewController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}
