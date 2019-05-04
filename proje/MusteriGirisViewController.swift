//
//  MusteriGirisViewController.swift
//  proje
//
//  Created by memo on 17.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class MusteriGirisViewController: UIViewController{
    
    @IBOutlet weak var girisText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Toast.sayfa = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func girisClick(_ sender: Any) {
        
        let nesne = Login()
        nesne.login(nesne: MusteriLogin(), data: self.dataHazirla())
        
        DispatchQueue.global(qos: .userInitiated).async {
            while(FirebaseBoolean.FonksiyonaGirisKontrol)
            {
                sleep(1)
                
            }
            DispatchQueue.main.async {
                
                if(FirebaseBoolean.LoginBasariKontrol){
                    self.menuKontrol()
                }
                else{
                    SVProgressHUD.dismiss()
                    Toast.make(mesaj: "Kullanici Adi Veya Şifre Hatalı")
                }
            }
            
        }
        // 7aaG5OeKIjXwza4pVw6qNWuXy0z1?-Lcw-fJR_JOFg_ZgZyeJ
        
        
        
    }
    func menuKontrol(){
        DispatchQueue.global(qos: .userInitiated).async {
            while(FirebaseBoolean.MenuDataKontrol){
                sleep(1)
            }
            
            DispatchQueue.main.async{
                SVProgressHUD.dismiss()
                self.musteriSayfaGecis()
            }
        }
    }
    
    func dataHazirla()->[String:String]{
        let text = self.girisText.text
        
        let textArray = text?.components(separatedBy: "?")
        
        var data = [String:String]()
        
        data["cafeID"] = textArray?[0]
        data["masaId"] = textArray?[1]
        return data
    }
    
    func musteriSayfaGecis(){
        let viewController:MusteriSayfaViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MusteriSayfaViewController") as! MusteriSayfaViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
}
