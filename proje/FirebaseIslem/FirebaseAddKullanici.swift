//
//  FirebaseAddKullanici.swift
//  proje
//
//  Created by memo on 18.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import FirebaseAuth
import SVProgressHUD
class FirebaseAddKullanici: FirebaseAddDataInterface{
    
    override public func addData(data: [String:String]) {
        SVProgressHUD.show(withStatus: "Kayit Olunuyor")
        Auth.auth().createUser(withEmail: data["kullaniciAd"]!, password: data["kullaniciSifre"]!)  {user, error in
            SVProgressHUD.dismiss()
            if error == nil && user != nil {
                Toast.make(mesaj: "Kayit Yapildi")
            }
            else{
                Toast.make(mesaj: "Kayit Yapilamadi")
            }
            
        }
        
    }
}
