//
//  FirebaseUpdateFiyat.swift
//  proje
//
//  Created by memo on 1.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseUpdateFiyat: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Admin.getNesne().getCadeId()).child("Menu").child(data["menuKatagori"]!).child(data["childKey"]!).child("Fiyat").setValue(Double(data["fiyat"]!) ?? 0)
        
    }
}
