//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Daria on 20.02.2024.
//

import UIKit

class SearchVC: UIViewController {
    
    let logeImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: .systemGreen, title: "Det Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView() {
        view.addSubview(logeImageView)
        logeImageView.translatesAutoresizingMaskIntoConstraints = false
        logeImageView.image = UIImage(named: "gh-logo")
        
    }
}
