//
//  MenuList.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
class MenuList {
    
    private static var nesne:MenuList?
    
    private init() {}
    
    static public func getNesne()->MenuList{
        if(nesne==nil){
            nesne = MenuList()
        }
        return nesne!
    }
    
    
    private var menuKatagori:[String] = []
    
    public func setMenuKatagori(menuAd:String){
        
        if(!self.menuKatagori.contains(menuAd))
        {
            self.menuKatagori.append(menuAd)
            self.menuIcerik.append([String]())
            self.menuIcerikKey.append([String]())
            self.menuFiyat.append([String]())
        }

    }
    
    public func getMenuKatagori()->[String]{
        return self.menuKatagori
    }
    public func getMenuKatagoriEleman(index:Int)->String{
        return self.menuKatagori[index]
    }
    public func getMenuKatagoriUzunlugu()->Int{
        return self.menuKatagori.count
    }
    
    
    private var menuIcerik = [[String]]()
    
    public func setMenuIcerik(index:Int, menuIcerik:String){
        self.menuIcerik[index].append(menuIcerik)
    }
    public func getMenuIcerik(parentIndex:Int, childIndex:Int)->String{
        return self.menuIcerik[parentIndex][childIndex]
    }

    
    
    
    private var menuFiyat = [[String]]()
    public func setMenuFiyat(index:Int, menuFiyat:String){
        self.menuFiyat[index].append(menuFiyat)
    }
    public func setMenuGuncelFiyat(parentKey:Int, childKey:Int,fiyat:String){
        self.menuFiyat[parentKey][childKey] = fiyat
    }
    public func getMenuFiyat(parentIndex:Int, childIndex:Int)->String{
        return self.menuFiyat[parentIndex][childIndex]
        
    }
    public func getMenuIcerik()->[[String]]{
        return self.menuFiyat;
    }
    
    private var menuIcerikKey = [[String]]()
    public func setMenuIcerikKey(index:Int, menuKey:String){
        
        self.menuIcerikKey[index].append(menuKey)
    }
    public func getMenuIcerikKey(parentIndex:Int, childIndex:Int)->String{
        return self.menuIcerikKey[parentIndex][childIndex]
    }
    public func getMenuIcerikKey()->[[String]]{
        return self.menuIcerikKey
    }
    
    public func getListUzunlugu(parentIndex:Int) ->Int{
        
        return self.menuIcerikKey[parentIndex].count
    }
    
    
    
    
}
