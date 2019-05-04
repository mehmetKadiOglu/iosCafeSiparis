//
//  HesapData.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase
class HesapData:GetFirebaseDataInterface{
    
    override public func getData(cafeID:String){
        
        let ref = Database.database().reference()

        ref.child(cafeID).child("siparisler").queryOrdered(byChild:"masaId").queryEqual(toValue: Musteri.getNesne().getTableId()).observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                
                let childData = child as?DataSnapshot
                let data = childData?.value as! NSDictionary
                
                let siparis = data["siparis"] as! String
                let fiyat = data["fiyat"] as! String
                let adet = data["adet"] as! String
                
                Musteri.getNesne().setSiparisler(siparis: siparis)
                Musteri.getNesne().setAdetler(adet: adet)
                Musteri.getNesne().setFiyatlar(fiyat: fiyat)
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
    }
}
