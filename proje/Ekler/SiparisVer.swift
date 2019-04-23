//
//  SiparisVer.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class SiparisVer{
    public func siparisHazirla(siparis:String,fiyat:String, adet:String){
        
        if siparis.count  > 10  && adet.count > 0 {
            
            var siparisData = [String:String]()
            siparisData["adet"] = adet
            siparisData["fiyat"] = fiyat
            siparisData["siparis"] = siparis
            siparisData["saat"] = self.saatAl()
            
        }

        
    }
    private func saatAl()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let saat = formatter.string(from: date)
        return saat
    }
}
