//
//  ProfileViewController.swift
//  MDProfile
//
//  Created by Songsit Pantayang on 26/10/2567 BE.
//

import UIKit
import MDFactory
import MDComponent

class ProfileViewController: UIViewController {

    @Injected var coordinating: Coordinating
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        title = "Profile"
        
        let button = RoundedButton()
        button.setTitle("Go to Home")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func didTapButton() {
        coordinating.navigateToHome(parent: self)
    }

}
