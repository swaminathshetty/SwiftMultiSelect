//
//  DropDownViewController.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

protocol DropDownControllerDelegate {
    func saveData(detailsArray:[String])
}

class DropDownViewController: UIViewController {

    var protocalObj : DropDownControllerDelegate?

    @IBOutlet weak var tableViewList: UITableView!
    
    let arrayList = ["Swami","Sai","Sandeep","Sanjay"]
    
    var selectedItem = String()
    var arraySelectedIndexes = [String]()
    var arrayStoredItems = [String]()

    @IBAction func actionDoneBtn(_ sender: Any) {
        
        if let del = self.protocalObj {
            del.saveData(detailsArray: arrayStoredItems)
        }
            self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSelectAllBtn(_ sender: UIButton) {
        
        guard let currentCell = tableView(tableViewList, cellForRowAt: IndexPath(row: sender.tag, section: 0)) as? DropDownCell else{
            return
        }
        arrayStoredItems.removeAll()
        arraySelectedIndexes.removeAll()

        self.selectedItem = currentCell.labelTitle.text!
        print("selectedItem : \(self.selectedItem)")

        for selectedItem in arrayList{
            self.arraySelectedIndexes.append(selectedItem)
        }
        tableViewList.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
extension DropDownViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "DropDownCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DropDownCell
        if cell == nil {
            cell = UITableViewCell(style:.subtitle, reuseIdentifier: identifier) as? DropDownCell
        }
        if self.selectedItem == arrayList[indexPath.row] as? String{
            cell?.checkBoxBtn.backgroundColor =  UIColor.red
        }else{
            cell?.checkBoxBtn.backgroundColor = UIColor.clear
        }
        
        for item in arraySelectedIndexes {
            if ((arrayList[indexPath.row]).contains(item)){
                if let firstName = arrayList[indexPath.row] as? String{
                        arrayStoredItems.append(firstName)
                        print("Items for saving : \(arrayStoredItems)")
                }
                cell?.checkBoxBtn.backgroundColor =  UIColor.red
            }
        }
        cell?.labelTitle.text = arrayList[indexPath.row]as? String
        
        cell?.checkBoxBtn.tag = indexPath.row
        cell?.checkBoxBtn .addTarget(self, action: #selector(self.CheckBoxAction(sender:)), for: .touchUpInside)
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 70.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        arrayStoredItems.removeAll()
        
        self.selectedItem = arrayList[indexPath.row]
        print("selectedItem : \(self.selectedItem)")
        
        if arraySelectedIndexes.contains(self.selectedItem) {
            print("Yes Already Checked")
            if let index = arraySelectedIndexes.index(of: self.selectedItem) {
                self.selectedItem = "NOTSELECTED"
                arraySelectedIndexes.remove(at: index)
            }
        }
        else{
            print("New Selection")
            self.arraySelectedIndexes.append(self.selectedItem)
        }
        print("arraySelectedIndexes : \(self.arraySelectedIndexes)")
        self.tableViewList.reloadData()

    }
    @objc func CheckBoxAction(sender:UIButton)
    {
        print("Selected Button : \(sender.tag)")
        guard let currentCell = tableView(tableViewList, cellForRowAt: IndexPath(row: sender.tag, section: 0)) as? DropDownCell else{
            return
        }
        arrayStoredItems.removeAll()
        
        self.selectedItem = currentCell.labelTitle.text!
        print("selectedItem : \(self.selectedItem)")
        
        if arraySelectedIndexes.contains(self.selectedItem) {
            print("Yes Already Checked")
            if let index = arraySelectedIndexes.index(of: self.selectedItem) {
                self.selectedItem = "NOTSELECTED"
                arraySelectedIndexes.remove(at: index)
            }
        }
        else{
            print("New Selection")
            self.arraySelectedIndexes.append(self.selectedItem)
        }
        print("arraySelectedIndexes : \(self.arraySelectedIndexes)")
        self.tableViewList.reloadData()
    }
    
}
