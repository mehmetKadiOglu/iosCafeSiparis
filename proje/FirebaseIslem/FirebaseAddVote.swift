//
//  FirebaseAddVote.swift
//  proje
//
//  Created by memo on 9.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseAddVote: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Musteri.getNesne().getCadeId()).child("musics").child(data["muzikKey"]!).child("vote").setValue(Int(data["oy"]!) ?? 0)
        
    }
}
