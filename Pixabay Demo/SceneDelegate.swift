//
//  SceneDelegate.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/23/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = AppStoryboard.Home.initialNavigationController()
        window?.makeKeyAndVisible()
    }



}

