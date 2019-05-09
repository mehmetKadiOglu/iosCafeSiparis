//
//  SiparisVer.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class SiparisVer{
    public func siparisHazirla(data:[String:String]){
        
        
        if (data["siparis"]!.count)  > 4  && (data["adet"]!.count) > 0 {
            
            print("ifinn içindeeee")
            var siparisData = [String:String]()
            siparisData = data
            siparisData["saat"] = SistemSaati.getSaat()
            
            self.siparisEkle(data: siparisData)
            
        }

        
    }
    
    private func siparisEkle(data:[String:String]){
        
        FirebaseProcess.execute(interface: FirebaseAddSiparis(), data: data)
        Musteri.getNesne().setAdetler(adet: data["adet"]!)
        Musteri.getNesne().setFiyatlar(fiyat: data["fiyat"]!)
        Musteri.getNesne().setSiparisler(siparis: data["siparis"]!)
        
    }
    
}
