//
//  MenuEkleViewController.swift
//  proje
//
//  Created by memo on 1.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit

class MenuEkleViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var menuFiyat: UITextField!
    @IBOutlet weak var menuIcerik: UITextField!
    @IBOutlet weak var menuKatagori: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    var menuGrupIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func ekleClick(_ sender: Any) {
        
        let data = self.dataHazirla()
        self.textBosalt()
        
        FirebaseProcess.execute(interface: FirebaseAddMenu(), data: data)
        
        self.menuListGuncelle(data: data)
        self.pickerView.reloadAllComponents()
    }
    
    func menuListGuncelle(data:[String:String]){
        
        if(MenuList.getNesne().getMenuKatagori().contains(data["menuKatagori"]!)){
            MenuList.getNesne().setMenuIcerik(index: self.menuGrupIndex, menuIcerik: data["menuIcerik"]!)
            MenuList.getNesne().setMenuFiyat(index: self.menuGrupIndex, menuFiyat: data["fiyat"]!)
        }else{
            let index = MenuList.getNesne().getMenuKatagoriUzunlugu()
            MenuList.getNesne().setMenuKatagori(menuAd: data["menuKatagori"]!)
            MenuList.getNesne().setMenuIcerik(index: index, menuIcerik: data["menuIcerik"]!)
            MenuList.getNesne().setMenuFiyat(index: index, menuFiyat: data["fiyat"]!)
        }
    }
    
    func dataHazirla() -> [String:String] {
        var data = [String:String]()
        data["menuKatagori"] = self.menuKatagori.text
        data["menuIcerik"] = self.menuIcerik.text
        data["fiyat"] = self.menuFiyat.text
        return data
    }
    func textBosalt(){
        self.menuKatagori.text = ""
        self.menuIcerik.text = ""
        self.menuFiyat.text = ""
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MenuList.getNesne().getMenuKatagoriUzunlugu()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return MenuList.getNesne().getMenuKatagoriEleman(index: row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //self.menuGrupIndex = row
       // let  menu = MenuList.getNesne().getMenuKatagoriEleman(index: row)

       // print(menu)
        self.menuKatagori.text = MenuList.getNesne().getMenuKatagoriEleman(index: row)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
