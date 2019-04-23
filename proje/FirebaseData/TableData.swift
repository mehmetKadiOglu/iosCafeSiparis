//
//  TableData.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase

class TableData: GetFirebaseDataInterface{
    override public func getData(cafeID:String){
        
        let ref = Database.database().reference()
        ref.child(cafeID).child("tables").queryOrdered(byChild: "Number").observe(.childAdded, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let masaNo = value?["Number"] as? Int ?? 1
            let key = snapshot.key
            
            TableList.getNesne().setMasaNoList(masaNo: masaNo)
            TableList.getNesne().setAnahtar(anahtar: key)
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}
