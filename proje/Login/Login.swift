//
//  Login.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class Login{
    
    public func login(nesne:LoginInterface, data:[String:String]){
        nesne.login(data: data)
    }
}
