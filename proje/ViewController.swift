//
//  ViewController.swift
//  proje
//
//  Created by memo on 15.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    @IBOutlet weak var kullaniciAdiText: UITextField!
    @IBOutlet weak var kullaniciSifreText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Toast.sayfa = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sefa(_ sender: Any) {
        let nesne = Login()
        let kullanici = self.kullaniciAdSifreAl()
        nesne.login(nesne: AdminLogin(), data: kullanici)
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
        
        
    }
    func menuKontrol(){
        
        DispatchQueue.global(qos: .userInitiated).async {
            while(FirebaseBoolean.MenuDataKontrol){
                sleep(1)
            }
            
            DispatchQueue.main.async{
                SVProgressHUD.dismiss()
                self.adminSayfaGecis()
            }
        }

    }
    
    @IBAction func kullaniciKayit(_ sender: Any) {
        
        let kullanici = self.kullaniciAdSifreAl()
        FirebaseProcess.execute(interface: FirebaseAddKullanici(), data: kullanici)
        
    }
    
    func adminSayfaGecis(){
        let viewController:AdminCafeYonetimViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdminCafeYonetimViewController") as! AdminCafeYonetimViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    func kullaniciAdSifreAl() ->([String : String]){
        
        var dizim = [String : String]()
        //dizim["kullaniciAd"] = self.kullaniciAdiText.text
       // dizim["kullaniciSifre"] = self.kullaniciSifreText.text
        
        
        dizim["kullaniciAd"] = "mehmet_kadi@outlook.com"
        dizim["kullaniciSifre"] = "123456789"
        
        
        return dizim
        
    }
}

