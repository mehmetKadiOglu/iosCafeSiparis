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
        self.menuKatagori.append(menuAd)
        self.menuIcerik.append([String]())
        self.menuIcerikKey.append([String]())
        self.menuFiyat.append([String]())
    }
    
    public func getMenuKatagori()->[String]{
        return self.menuKatagori
    }
    
    
    private var menuIcerik = [[String]]()
    
    public func setMenuIcerik(index:Int, menuIcerik:String){
        self.menuIcerik[index].append(menuIcerik)
    }
    
    
    private var menuFiyat = [[String]]()
    public func setMenuFiyat(index:Int, menuFiyat:String){
        self.menuFiyat[index].append(menuFiyat)
    }
    
    private var menuIcerikKey = [[String]]()
    public func setMenuIcerikKey(index:Int, menuIcerik:String){
        self.menuIcerik[index].append(menuIcerik)
    }
    
    
    
    
}
