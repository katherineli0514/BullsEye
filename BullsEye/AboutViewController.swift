//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Katherine Li on 10/19/18.
//  Copyright © 2018 katherine. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var WKWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let infoPageUrl = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let loadRequest = URLRequest(url: infoPageUrl)
            WKWebView.load(loadRequest)
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
