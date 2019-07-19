//
//  SiparisVer.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class SiparisVer{
    public func siparisHazirla(data:[String:String])->Bool{
        
        var kontrol:Bool = false
        if (data["siparis"]!.count)  > 1 {
            if (data["adet"]!.count) > 0{
                var siparisData = [String:String]()
                siparisData = data
                siparisData["saat"] = SistemSaati.getSaat()
                
                self.siparisEkle(data: siparisData)
                kontrol = true
            }
            else{
                Toast.make(mesaj: "Lütfen Adet Giriniz" )
            }
        }
        else{
            Toast.make(mesaj: "Lütfen Menu Seçimi Yapınız" )
        }
        
        
        return kontrol
        
    }
    
    private func siparisEkle(data:[String:String]){
        
        FirebaseProcess.execute(interface: FirebaseAddSiparis(), data: data)
        Musteri.getNesne().setAdetler(adet: data["adet"]!)
        Musteri.getNesne().setFiyatlar(fiyat: data["fiyat"]!)
        Musteri.getNesne().setSiparisler(siparis: data["siparis"]!)
        
    }
    
}
