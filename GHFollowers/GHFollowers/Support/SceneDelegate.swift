//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by Daria on 20.02.2024.
//

import UIKit
class DependencyManager {
    static func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
    }
    static func createFavofitesNC() -> UINavigationController {
        let favoritesListVC = FavoritesListVC()
        favoritesListVC.title = "Favorites"
        favoritesListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListVC)
    }
    static func createTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().tintColor = .systemGreen
        tabbar.viewControllers = [createSearchNC(), createFavofitesNC()]
        
        return tabbar
    }
    static func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = DependencyManager.createTabBar()
        window?.makeKeyAndVisible()
        DependencyManager.configureNavigationBar()
    }
}

func configureNavigationBar() {
    UINavigationBar.appearance().tintColor = .systemGreen
}
