//
//  FirebaseMasaOySaatGuncelle.swift
//  proje
//
//  Created by memo on 9.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseMasaOySaatGuncelle: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Musteri.getNesne().getCadeId()).child("tables").child(Musteri.getNesne().getTableId()).child("voteTime").setValue(data["oySaati"])
        
    }
}
