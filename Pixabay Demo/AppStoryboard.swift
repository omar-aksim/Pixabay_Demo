//
//  AppStoryboard.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/24/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

enum AppStoryboard : String {
    case Home
    
    var instance : UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T{
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController {
        return instance.instantiateInitialViewController() ?? UIViewController()
    }
    
    func initialNavigationController() -> UINavigationController {
        return instance.instantiateInitialViewController() as? UINavigationController ?? UINavigationController()
    }
}
