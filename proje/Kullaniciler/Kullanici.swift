//
//  Kullanici.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class Kullanici {
    
    private var CafeId:String = ""
    
    public func getCadeId()-> String{
        return self.CafeId
    }
    
    public func setCafeId(CafeId:String){
        self.CafeId = CafeId
    }
    
    public func createList(){
        
        let getData = FirebaseData()
        getData.bringData(nesne:MusicData(), cafeID:self.getCadeId())
        getData.bringData(nesne: MenuData(), cafeID:self.getCadeId())
    }
}
