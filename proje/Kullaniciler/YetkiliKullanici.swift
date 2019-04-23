//
//  YetkiliKullanici.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class YetkiliKullanici:Kullanici {
    
   override public func createList(){
        super.createList()
        let getData = FirebaseData()
        getData.bringData(nesne:TableData(), cafeID:self.getCadeId())
    
    }
}
