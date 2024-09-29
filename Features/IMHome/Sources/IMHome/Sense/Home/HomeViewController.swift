//
//  HomeViewController.swift
//  IMHome
//
//  Created by DARRAN on 29/9/2567 BE.
//

import UIKit
import IMCore
import Factory

class HomeViewController: UIViewController, Storyboardable {

    @Injected(\.logger) var logger: Loggers
    
    static var storyboardName: String { "IMHome" }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logger.log("HomeViewController")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
