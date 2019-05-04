//
//  MusteriSiparisViewController.swift
//  proje
//
//  Created by memo on 2.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit

class MusteriSiparisViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var siparisAdet: UITextField!
    @IBOutlet weak var menuIcerikView: UITableView!
    @IBOutlet weak var menuGrupView: UIPickerView!
    @IBOutlet weak var secilenUrun: UILabel!
    var menuGrupIndex:Int = 0
    var menuIcerikIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuIcerikView.delegate = self
        self.menuIcerikView.dataSource = self
        self.menuGrupView.delegate = self
        self.menuGrupView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func geriGel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func siparisVerClick(_ sender: Any) {
        
        print("Siparisss Verdeee")
        let nesne = SiparisVer()
        nesne.siparisHazirla(data: self.siparisDataHazirla())
        
    }
    func siparisDataHazirla()->[String:String]{
        var data = [String:String]()
        data["siparis"] = self.secilenUrun.text
        data["fiyat"] = MenuList.getNesne().getMenuFiyat(parentIndex: self.menuGrupIndex, childIndex: self.menuIcerikIndex)
        data["adet"] = self.siparisAdet.text
        
        return data
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.getNesne().getListUzunlugu(parentIndex: self.menuGrupIndex)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.menuIcerikIndex = indexPath.row
        self.secilenUrun.text = MenuList.getNesne().getMenuIcerik(parentIndex: self.menuGrupIndex, childIndex: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "musteriMenuCell", for: indexPath) as! MenuTableCellViewController
        cell.urunLabel.text = MenuList.getNesne().getMenuIcerik(parentIndex: self.menuGrupIndex, childIndex: indexPath.row)
        cell.fiyatLabel.text = MenuList.getNesne().getMenuFiyat(parentIndex: self.menuGrupIndex, childIndex: indexPath.row)

        return cell
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
        self.menuGrupIndex = row
        self.secilenUrun.text = ""
        self.menuIcerikView.reloadData()
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
