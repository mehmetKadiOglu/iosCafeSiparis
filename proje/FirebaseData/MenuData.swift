//
//  MenuData.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

import FirebaseDatabase

class MenuData: GetFirebaseDataInterface{
    override public func getData(cafeID:String){
        print("menu giriş")
        print(cafeID)
        let ref = Database.database().reference()
        var index = -1
        ref.child(cafeID).child("Menu").observeSingleEvent(of: .value, with: { (snapshot) in
            FirebaseBoolean.MenuDataKontrol = true
            for base in snapshot.children {
                let baseChild = base as?DataSnapshot
                let key = baseChild?.key ?? " "
                MenuList.getNesne().setMenuKatagori(menuAd: key)
                index = index + 1
                
                for childs in (baseChild?.children)!{
                    
                    let childsData = childs as?DataSnapshot
                    let data = childsData?.value as? NSDictionary
                    
                    let urun = data?["Urun"] as? String ?? ""
                    let fiyat = data?["Fiyat"] as? String ?? ""
                    let key = childsData?.key ?? " "
                    
                    MenuList.getNesne().setMenuIcerik(index: index, menuIcerik: urun )
                    MenuList.getNesne().setMenuFiyat(index: index, menuFiyat: fiyat)
                    MenuList.getNesne().setMenuIcerikKey(index: index, menuIcerik: key)
                    
                    
                }
            }
            FirebaseBoolean.MenuDataKontrol = false
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
    }
}
