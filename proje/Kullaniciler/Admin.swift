//
//  Admin.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class Admin: YetkiliKullanici {
    
    private static var nesne:Admin?
    
    static public func getNesne()->Admin{
        
        if nesne == nil{
            nesne = Admin()
        }
        return nesne!
    }
    
}
