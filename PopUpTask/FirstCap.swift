//
//  FirstCap.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

class FirstCap: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(" First Cap :\(Singleton.sharedInstance.arrayData))")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
