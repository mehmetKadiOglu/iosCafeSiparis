//
//  FirebaseProcess.swift
//  proje
//
//  Created by memo on 18.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import UIKit
class FirebaseProcess {
    public static func execute(interface:FirebaseAddDataInterface, data:[ String : String ]){
        interface.addData(data: data)
    }
}
