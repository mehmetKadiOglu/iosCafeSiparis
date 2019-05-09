//
//  SistemSaati.swift
//  proje
//
//  Created by memo on 9.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
class SistemSaati{
    
    public static func getSaat()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let saat = formatter.string(from: date)
        return saat
    }
}
