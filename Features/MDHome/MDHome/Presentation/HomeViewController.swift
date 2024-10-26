//
//  HomeViewController.swift
//  MDHome
//
//  Created by prongbang on 26/10/2567 BE.
//

import UIKit
import MDFactory
import MDComponent

class HomeViewController: UIViewController {
    
    @Injected var coordinating: Coordinating
    @Injected var getPostListUseCase: GetPostListUseCase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        initial()
    }
    
    private func setup() {
        view.backgroundColor = .white
        title = "Home"
        
        let button = RoundedButton()
        button.setTitle("Go to Setting")
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func initial() {
        getPostListUseCase.execute().done { result in
            switch result {
            case .success(let data):
                print("success: \(data)")
            case .noContent:
                print("noContent")
            case .badRequest:
                print("badRequest")
            case .unauthorized:
                print("unauthorized")
            default:
                print("failure")
            }
        }.catch { e in
            print("failure: \(e)")
        }
    }
    
    @objc func didTapButton() {
        coordinating.navigateToSetting(parent: self)
    }
}
