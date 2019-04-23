//
//  FirebaseAddMusic.swift
//  proje
//
//  Created by memo on 21.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FirebaseAddMusic: FirebaseAddDataInterface {
    
    override public func addData(data:[String:String]){
        
        let ref = Database.database().reference()
        
        ref.child(Admin.getNesne().getCadeId()).child("musics").childByAutoId().setValue([
            "musicName": data["muzikAdi"] ?? " ",
            "vote": 0
            ])
        
        
    }
}
