//
//  MainViewController.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionDropDownBtn(_ sender: Any) {
        
        let  storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier:"DropDownViewController") as? DropDownViewController
        secondVC?.protocalObj = self
        self.present(secondVC!, animated: true)

    }
    

    @IBAction func actionSubmitBtn(_ sender: Any) {
        let  storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let capMenuController = storyBoard.instantiateViewController(withIdentifier:"CapMenuController") as? CapMenuController
        self.present(capMenuController!, animated: true)

    }
    

}
extension MainViewController:DropDownControllerDelegate{
    func saveData(detailsArray: [String]) {
        print("Fetched Data : \(detailsArray)")
        Singleton.sharedInstance.arrayData = detailsArray

    }
}

