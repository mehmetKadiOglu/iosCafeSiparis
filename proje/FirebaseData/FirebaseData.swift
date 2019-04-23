//
//  FirebaseData.swift
//  proje
//
//  Created by memo on 19.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

class FirebaseData {
    public func bringData(nesne:GetFirebaseDataInterface, cafeID:String){
        nesne.getData(cafeID: cafeID)
    }
}
