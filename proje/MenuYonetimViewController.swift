//
//  MenuYonetimViewController.swift
//  proje
//
//  Created by memo on 17.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

import UIKit

class MenuYonetimViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var secilenUrun: UILabel!
    @IBOutlet weak var yeniFiyatText: UITextField!
    @IBOutlet weak var menuGrup: UIPickerView!
    @IBOutlet weak var urunlerTableView: UITableView!
    
    var menuGrupIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.urunlerTableView.delegate = self
        self.urunlerTableView.dataSource = self
        self.menuGrup.delegate = self
        self.menuGrup.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func fiyatGuncelleClick(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuList.getNesne().getListUzunlugu(parentIndex: self.menuGrupIndex)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableCellViewController
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
        self.urunlerTableView.reloadData()
    }
    
    
    
}
