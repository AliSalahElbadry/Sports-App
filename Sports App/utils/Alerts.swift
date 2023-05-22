//
//  Alerts.swift
//  Sports App
//
//  Created by Mac on 17/05/2023.
//

import Foundation
import UIKit

class Alerts{
    private var instance:Alerts?
    func getInstance()->Alerts{
        if instance == nil{
            instance = Alerts()
        }
        return instance!
    }
     func showAlert(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
         let okAction = UIAlertAction(title: "OK", style: .default) { it in
             alert.dismiss(animated: true)
         }
         alert.addAction(okAction)
        alert.present(animated: true, completion: nil)
    }
     func showAlert(msg:String,complitionHandeler:(() -> Void)?)
    {
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { it in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        alert.present(animated: true, completion: complitionHandeler)
    }
}
extension UIAlertController {
    
    func show() {
        present(animated: true, completion: nil)
    }
    
    func present(animated: Bool, completion: (() -> Void)?) {
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            presentFromController(controller: rootVC, animated: animated, completion: completion)
        }
    }
    
    private func presentFromController(controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if
            let navVC = controller as? UINavigationController,
            let visibleVC = navVC.visibleViewController
        {
            presentFromController(controller: visibleVC, animated: animated, completion: completion)
        } else if
            let tabVC = controller as? UITabBarController,
            let selectedVC = tabVC.selectedViewController
        {
            presentFromController(controller: selectedVC, animated: animated, completion: completion)
        } else if let presented = controller.presentedViewController {
            presentFromController(controller: presented, animated: animated, completion: completion)
        } else {
            controller.present(self, animated: animated, completion: completion);
        }
    }
}
