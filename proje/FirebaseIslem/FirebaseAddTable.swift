//
//  FirebaseAddTable.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseAddTable: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Admin.getNesne().getCadeId()).child("tables").childByAutoId().setValue([
            "Number":Int(data["masaNo"]!) ?? 0,
            "voteTime":"00:00"
            ])
        
        
        
    }
}
