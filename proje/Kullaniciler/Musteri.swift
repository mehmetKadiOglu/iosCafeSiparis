//
//  Musteri.swift
//  proje
//
//  Created by memo on 20.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class Musteri:YetkisizKullanici{
    
    private static var nesne:Musteri?
    
    static public func getNesne()->Musteri{
        if nesne == nil{
            nesne = Musteri()
        }
        return nesne!
    }
    
}
