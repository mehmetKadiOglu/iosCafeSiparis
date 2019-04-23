//
//  YetkisizKullanici.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class YetkisizKullanici: Kullanici{
    
    private var siparisler = [String]()
    private var adetler = [Int]()
    private var fiyatlar = [Double]()
    private var oyTarihi:String = ""
    private var tableId:String = ""
    //private var siparisNesne = SiparisVer()
    
    public func setTableId(tableId:String){
        self.tableId = tableId
    }
    public func getTableId()->String{
        return self.tableId
    }
    
    public func setOyTarihi(oyTarihi:String){
        self.oyTarihi = oyTarihi
    }
    public func getOyTarihi()->String{
        return self.oyTarihi
    }
    
    public func setSiparisler(siparis:String){
        self.siparisler.append(siparis)
    }
    public func getSiparisler()->[String]{
        return self.siparisler
    }
    
    public func setAdetler(adet:Int){
        self.adetler.append(adet)
    }
    public func getAdetler()->[Int]{
        return self.adetler
    }
    
    public func setfiyatlar(fiyat:Double){
        self.fiyatlar.append(fiyat)
    }
    public func getSiparisler()->[Double]{
        return self.fiyatlar
    }
    
    override public func createList(){
        super.createList()
        let getData = FirebaseData()
        getData.bringData(nesne:HesapData(), cafeID:self.getCadeId())
        
    }
    
    
    
    
}
