//
//  ViewController.swift
//  App
//
//  Created by DARRAN on 28/9/2567 BE.
//

import UIKit
import Factory
import IMCore


class ViewController: UIViewController {

    @Injected(\.logger) var logger: Loggers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.log("Hello Factory")
    }

}

