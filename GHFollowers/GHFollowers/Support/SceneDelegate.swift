//
//  SceneDelegate.swift
//  GHFollowers
//
//  Created by Daria on 20.02.2024.
//

import UIKit
class DependencyManager {
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
        window?.rootViewController = GFTabbarController()
        window?.makeKeyAndVisible()
        DependencyManager.configureNavigationBar()
    }
}
