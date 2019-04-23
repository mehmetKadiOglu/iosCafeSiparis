//
//  AdminLogin.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import SVProgressHUD
import FirebaseAuth

class AdminLogin: LoginInterface{
    
    override public func login(data:[String:String]){
        
        FirebaseBoolean.FonksiyonaGirisKontrol = true
        
        SVProgressHUD.show(withStatus: "Giriş Yapılıyor")
        Auth.auth().signIn(withEmail: data["kullaniciAd"] ?? "", password: data["kullaniciSifre"] ?? "") { user, error in
             if error == nil && user != nil {
                FirebaseBoolean.LoginBasariKontrol = true
                SVProgressHUD.show(withStatus: "Veriler Cekiliyor")
                let userID = Auth.auth().currentUser!.uid
                Admin.getNesne().setCafeId(CafeId: userID)
                Admin.getNesne().createList()
             }else{
                
                
                FirebaseBoolean.LoginBasariKontrol = false
            }
            
            FirebaseBoolean.FonksiyonaGirisKontrol = false
         }
        
    }
}

