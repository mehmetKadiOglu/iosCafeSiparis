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
    private var adetler = [String]()
    private var fiyatlar = [String]()
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
    public func getSiparisler(index:Int)->String{
        return self.siparisler[index]
    }
    
    public func setAdetler(adet:String){
        self.adetler.append(adet)
    }
    public func getAdetler(index:Int)->String{
        return self.adetler[index]
    }
    
    public func setFiyatlar(fiyat:String){
        self.fiyatlar.append(fiyat)
    }
    public func getFiyatlar(index:Int)->String{
        return self.fiyatlar[index]
    }
    
    public func getListLength()->Int{
        
        return self.fiyatlar.count
    }
    
    override public func createList(){
        super.createList()
        let getData = FirebaseData()
        getData.bringData(nesne:HesapData(), cafeID:self.getCadeId())
        
    }
    
    
    
    
}
