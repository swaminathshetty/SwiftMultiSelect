//
//  SingletonClass.swift
//  PopUpTask
//
//  Created by Swaminath on 5/19/18.
//  Copyright © 2018 msr. All rights reserved.
//

import UIKit

class Singleton: NSObject
{
    
    static let sharedInstance = Singleton()
    
    var userName:String!
    var password:String!
    
    var userInfo = (ID: "bobthedev", Password: 01036343984)
    
    var arrayData = [String]()
    
    private override init() {} //This prevents
    
}


