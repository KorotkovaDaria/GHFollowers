//
//  GFAlertVC.swift
//  GHFollowers
//
//  Created by Daria on 21.02.2024.
//

import UIKit

class GFAlertVC: UIViewController {
    
    let containerView = GFAlertContainerView()
    let titleLabel = GFTitleLabel(textAligment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAligment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let paddin: CGFloat = 20
    
    init(alertTitle: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        configureContrainerView()
        configureTitlelabel()
        configureActionButton()
        configureMessageTitle()
        
    }
    
    func configureContrainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitlelabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddin),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddin),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddin),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "OK", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddin),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddin),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddin),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureMessageTitle() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable tot complere request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddin),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddin),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }

    @objc func dismissVC() {
        dismiss(animated: true)
    }
}
