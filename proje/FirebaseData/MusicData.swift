//
//  MusicData.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MusicData: GetFirebaseDataInterface {
    
    override public func getData(cafeID:String){
        let ref = Database.database().reference()
        ref.child(cafeID).child("musics").queryOrdered(byChild: "vote").observe(.childAdded, with: { (snapshot) in

            let value = snapshot.value as? NSDictionary
            let muzikAdi = value?["musicName"] as? String ?? ""
            let oySayisi = value?["vote"] as? Int ?? 1
            let key = snapshot.key
            MuzikList.getNesne().setMuzikAdi(muzikAdi: muzikAdi)
            MuzikList.getNesne().setMuzikOylari(oySayisi: oySayisi)
            MuzikList.getNesne().setAnahtar(anahtar: key)
            
            if( GlobalNesne.muzikViewNesne != nil){
                GlobalNesne.muzikViewNesne?.musicTableViewim.reloadData()
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        ref.child(cafeID).child("musics").observe(.childChanged, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            let muzikAdi = value?["musicName"] as? String ?? ""
            MuzikList.getNesne().muzikListesiGuncelle(muzikAdi: muzikAdi)
            
            if(GlobalNesne.musteriMuzikViewNesne != nil){
                GlobalNesne.musteriMuzikViewNesne?.muzikTableView.reloadData()
            }
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
}
