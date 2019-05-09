//
//  MusteriMuzikViewController.swift
//  proje
//
//  Created by memo on 2.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit

class MusteriMuzikViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var muzikLabel: UILabel!
    @IBOutlet weak var muzikTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.muzikTableView.delegate = self
        self.muzikTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func oyVerClick(_ sender: Any) {
        

        var guncelSaat =  SistemSaati.getSaat().components(separatedBy: ":")
        var musteriSaat = Musteri.getNesne().getOyTarihi().components(separatedBy: ":")
        
        var fark = Int(guncelSaat[0])! - Int(musteriSaat[0])!
        
        fark = (fark * 60) + (Int(guncelSaat[1])! - Int(musteriSaat[1])!)
        
        if (fark >= 15){
            print(guncelSaat[0] + ":" + guncelSaat[1])
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MuzikList.getNesne().getMuzikAdi().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "muzikCell", for: indexPath) as! MuziklerTableViewCellViewController
        cell.muzikAdi.text = MuzikList.getNesne().getMuzikAdi(index: indexPath.row)
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
