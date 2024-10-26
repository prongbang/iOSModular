//
//  RoundedButton.swift
//  MDComponent
//
//  Created by prongbang on 26/10/2567 BE.
//

import UIKit

public class RoundedButton: UIButton {

    public func setTitle(_ title: String) {
        setTitle(title, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 20
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
}
