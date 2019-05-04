//
//  MusteriHesapViewController.swift
//  proje
//
//  Created by memo on 2.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit

class MusteriHesapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var toplamMiktarLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        toplamMiktarLabel.text = "Toplam Tutar = " + self.toplamUcretHesapla()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toplamUcretHesapla()->String{
        var toplamUcret:Double = 0.0;
        for index in 0...Musteri.getNesne().getListLength()-1{
            
            toplamUcret = toplamUcret + ( Double(Musteri.getNesne().getAdetler(index: index))! * Double(Musteri.getNesne().getFiyatlar(index: index))! )
        }
        
        return String(toplamUcret)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Musteri.getNesne().getListLength()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HesapCell", for: indexPath) as! HesapTableViewCell
        cell.urunLabel.text = Musteri.getNesne().getSiparisler(index: indexPath.row)
        cell.fiyatLabel.text = Musteri.getNesne().getFiyatlar(index: indexPath.row)
        cell.adetLabel.text = Musteri.getNesne().getAdetler(index: indexPath.row)

        return cell
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
