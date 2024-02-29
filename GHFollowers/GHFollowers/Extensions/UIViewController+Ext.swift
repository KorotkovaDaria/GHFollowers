//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Daria on 21.02.2024.
//

import UIKit
import SafariServices



extension UIViewController {
    func presentGFAlertOnMainThread(title: String, messeage: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: messeage, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
