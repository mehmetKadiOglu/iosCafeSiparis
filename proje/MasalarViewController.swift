//
//  MasalarViewController.swift
//  proje
//
//  Created by memo on 17.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

import UIKit

class MasalarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var tableViewim: UITableView!
    @IBOutlet weak var MasaText: UITextField!
    
    let masalarimm = ["naber","iyiSen","ne demek"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewim.delegate = self
        self.tableViewim.dataSource = self
        print("tableLisstt")
        print(TableList.getNesne().getMasaNoList())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func eklemeButton(_ sender: Any) {
        
        let data = self.dataHazirla()
        
        FirebaseProcess.execute(interface: FirebaseAddTable(), data: data)
        
        TableList.getNesne().setMasaNoList(masaNo: Int(data["masaNo"]!)!)
        
        tableViewim.reloadData()
        
    }
    
    func dataHazirla() -> [String:String] {
        var data = [String:String]()
        data["masaNo"] = self.MasaText.text
        self.MasaText.text = ""
        return data
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableList.getNesne().getMasaNoList().count
        //return masalarimm.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MasalarTableViewCellViewController
        cell.satirLabel.text = String(TableList.getNesne().getMasaNoList(index: indexPath.row))
        //cell.satirLabel.text = masalarimm[indexPath.row]
        return cell/*
        let cell = UITableViewCell()
         //cell.textLabel?.text = String(TableList.getNesne().getMasaNoList(index: indexPath.row))
        cell.textLabel?.text = masalarimm[indexPath.row]
        return cell*/
    }
    
    
    
}
