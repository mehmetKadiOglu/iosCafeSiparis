//
//  TableMusicParentList.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
class TableMusicParentList{
    
    internal var anahtarList:[String] = []
    public func setAnahtar(anahtar:String){
        self.anahtarList.append(anahtar)
    }
    public func getAnahtar(index:Int)->String{
        return self.anahtarList[index]
    }
    
    
}
