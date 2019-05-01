//
//  AdminCafeYonetimViewController.swift
//  proje
//
//  Created by memo on 17.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import UIKit

class AdminCafeYonetimViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print(MenuList.getNesne().getMenuIcerikKey())
        print(MenuList.getNesne().getMenuIcerik())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
