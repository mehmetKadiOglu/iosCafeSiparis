//
//  FirebaseAddSiparis.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseAddSiparis: FirebaseAddDataInterface{
    
    override public func addData(data:[String:String]){
        
       let ref = Database.database().reference()
        
        ref.child(Musteri.getNesne().getCadeId()).child("siparisler").childByAutoId().setValue([
            
            "adet":data["adet"] ?? " ",
            "fiyat":data["fiyat"] ?? " ",
            "siparis":data["siparis"] ?? " ",
            "tarih":data["saat"] ?? " ",
            "siparisDurum":0,
            "masaId":Musteri.getNesne().getTableId(),
            
        ])
        
        
        
    }
    
}
