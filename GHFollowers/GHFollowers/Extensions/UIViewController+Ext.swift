//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Daria on 21.02.2024.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, messeage: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: messeage, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
