//
//  MuzikList.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
class MuzikList: TableMusicParentList {
    
    private static var nesne:MuzikList?
    
    private override init() {}
    
    static public func getNesne()->MuzikList{
        if(nesne==nil){
            nesne = MuzikList()
        }
        return nesne!
    }
    
    private var muzikAdiList:[String] = []
    
    public func setMuzikAdi(muzikAdi:String){
        self.muzikAdiList.append(muzikAdi)
    }
    public func getMuzikAdi(index:Int)->String{
        return self.muzikAdiList[index]
    }
    public func getMuzikAdi()->[String]{
        return self.muzikAdiList
    }
    
    
    private var muzikOylariList:[Int] = []
    public func setMuzikOylari(oySayisi:Int){
        self.muzikOylariList.append(oySayisi)
    }
    public func getMuzikOylari(index:Int)->Int{
        return self.muzikOylariList[index]
    }
    
    private var tersCevirmeKontrol: Bool = false
    private func setTersCevirmeKontrol(){
        self.tersCevirmeKontrol = true
    }
    public func getTersCevirmeKontrol() -> Bool{
        return self.tersCevirmeKontrol
    }
    
    
    public func diziTersCevir(){
        if !self.getTersCevirmeKontrol(){
            self.setTersCevirmeKontrol()
            self.anahtarList.reverse()
            self.muzikAdiList.reverse()
            self.muzikOylariList.reverse()
        }
    }
    
    
    
    public func muzikListesiGuncelle(muzikAdi:String){

        let index = self.muzikAdiİndeksBul(muzikAdi: muzikAdi)
        self.muzikOylariList[index] += 1
        self.listeDolaş(index: index)
        
        
    }
    private func muzikAdiİndeksBul(muzikAdi:String)->Int{
        var index = 0
        for i in (0...self.muzikAdiList.count-1) {
            if self.muzikAdiList[i] == muzikAdi {
            index = i
            break
            }
        }
        return index
    }
    
    private func listeDolaş(index:Int){
        
        var listeIndex = index
        while listeIndex-1 >= 0{
            if(self.muzikOylariList[listeIndex] > self.muzikOylariList[listeIndex-1]){
                self.valueYerDegis(index: listeIndex)
                listeIndex = listeIndex - 1
            }
            else {
                break
            }
        }
    }
    
    private func valueYerDegis(index:Int){
        let anahtar = self.anahtarList[index-1]
        let oy = self.muzikOylariList[index-1]
        let muzikAdi = self.muzikAdiList[index-1]
        
        self.anahtarList[index-1] = self.anahtarList[index]
        self.muzikOylariList[index-1] = self.muzikOylariList[index]
        self.muzikAdiList[index-1] = self.muzikAdiList[index]
        
        self.anahtarList[index] = anahtar
        self.muzikOylariList[index] = oy
        self.muzikAdiList[index] = muzikAdi
    }

}
