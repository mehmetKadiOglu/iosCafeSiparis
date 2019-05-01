//
//  FirebaseAddMenu.swift
//  proje
//
//  Created by memo on 1.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseAddMenu: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Admin.getNesne().getCadeId()).child("Menu").child(data["menuKatagori"]!).childByAutoId().setValue([
            "Urun": data["menuIcerik"] ?? " ",
            "Fiyat": Double(data["fiyat"]!) ?? 0
            ])
        
        
    }
}
