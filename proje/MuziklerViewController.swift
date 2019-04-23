//
//  MuziklerViewController.swift
//  proje
//
//  Created by memo on 17.04.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import Foundation

import UIKit

class MuziklerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var musicTableViewim: UITableView!
    @IBOutlet weak var muzikAdi: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GlobalNesne.muzikViewNesne = self
        self.musicTableViewim.delegate = self
        self.musicTableViewim.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func muzikEkle(_ sender: Any) {
        
        FirebaseProcess.execute(interface: FirebaseAddMusic(), data: self.dataHazirla())
        
        
    }
    
    func dataHazirla() -> [String:String] {
        var data = [String:String]()
        data["muzikAdi"] = self.muzikAdi.text
        self.muzikAdi.text = ""
        return data
    }
    
    func reloadData(){
        DispatchQueue.global(qos: .userInitiated).async {

            DispatchQueue.main.async {
            }
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MuzikList.getNesne().getMuzikAdi().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "muzikCell", for: indexPath) as! MuziklerTableViewCellViewController
        cell.muzikAdi.text = MuzikList.getNesne().getMuzikAdi(index: indexPath.row)
        //cell.satirLabel.text = masalarimm[indexPath.row]
        return cell/*
         let cell = UITableViewCell()
         //cell.textLabel?.text = String(TableList.getNesne().getMasaNoList(index: indexPath.row))
         cell.textLabel?.text = masalarimm[indexPath.row]
         return cell*/
    }

    
    
}
