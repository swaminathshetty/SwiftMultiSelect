//
//  CapMenuController.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

class CapMenuController: UIViewController {

    var pageMenu : CAPSPageMenu?
    var VcArray : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Singleton.sharedInstance.arrayData)

        
        guard let firstController = self.storyboard?.instantiateViewController(withIdentifier: "FirstCap") as? FirstCap else{return}
        firstController.title = "First"
        VcArray.append(firstController)
        
        guard let secondController = self.storyboard?.instantiateViewController(withIdentifier: "SecondCap") as? SecondCap else{return}
        secondController.title = "SecondCap"
        VcArray.append(secondController)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1),
            .menuItemSeparatorColor(.red),
            .bottomMenuHairlineColor(.green),
            .scrollAnimationDurationOnMenuItemTap(2),
            .selectedMenuItemLabelColor(.yellow)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: VcArray, frame:CGRect(x:0.0 ,y:0 , width: self.view.frame.width, height:self.view.frame.height), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)

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
