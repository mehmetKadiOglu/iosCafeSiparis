//
//  MusteriLogin.swift
//  proje
//
//  Created by memo on 2.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import SVProgressHUD
import FirebaseDatabase

class MusteriLogin: LoginInterface{
    
    override public func login(data:[String:String]){
        
        FirebaseBoolean.FonksiyonaGirisKontrol = true
        
        SVProgressHUD.show(withStatus: "Giriş Yapılıyor")
        let ref = Database.database().reference()
        
        ref.child(data["cafeID"]!).child("tables").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            for child in snapshot.children{
                
                let childsData = child as?DataSnapshot
                
                if (childsData?.key == data["masaId"]){
                    let masaData = childsData?.value as? NSDictionary
                    
                    Musteri.getNesne().setCafeId(CafeId: data["cafeID"]!)
                    Musteri.getNesne().setTableId(tableId: data["masaId"]!)
                    Musteri.getNesne().setOyTarihi(oyTarihi: masaData!["voteTime"]! as! String)
                    Musteri.getNesne().createList()
                    SVProgressHUD.show(withStatus: "Veriler Cekiliyor")
                    FirebaseBoolean.LoginBasariKontrol = true
                    break
                }
                
            }
            
            FirebaseBoolean.FonksiyonaGirisKontrol = false

            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
    }
}
