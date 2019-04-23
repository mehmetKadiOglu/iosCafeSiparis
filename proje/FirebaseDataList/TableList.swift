//
//  TableList.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
class TableList: TableMusicParentList{
    
    
    private static var nesne:TableList?
    
    private override init() {}
    
    static public func getNesne()->TableList{
        if(nesne==nil){
            nesne = TableList()
        }
        return nesne!
    }
    
    private var masaNoList:[Int] = []
    public func setMasaNoList(masaNo:Int){
        self.masaNoList.append(masaNo)
    }
    public func getMasaNoList(index:Int)->Int{
        return self.masaNoList[index]
    }
    public func getMasaNoList()->[Int]{
        return self.masaNoList
    }
}
