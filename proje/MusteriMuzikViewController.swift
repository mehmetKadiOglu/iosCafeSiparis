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
    var secilenMuzikIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MuzikList.getNesne().diziTersCevir()
        self.muzikTableView.delegate = self
        self.muzikTableView.dataSource = self
        GlobalNesne.musteriMuzikViewNesne = self
        
        Toast.sayfa = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func geriGel(_ sender: Any) {
        GlobalNesne.musteriMuzikViewNesne = nil
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oyVerClick(_ sender: Any) {
        
        
        let guncelSaat =  SistemSaati.getSaat()
        var guncelSaatSplit = guncelSaat.components(separatedBy: ":")
        var musteriSaat = Musteri.getNesne().getOyTarihi().components(separatedBy: ":")
        
        var fark = Int(guncelSaatSplit[0])! - Int(musteriSaat[0])!
        
        fark = (fark * 60) + (Int(guncelSaatSplit[1])! - Int(musteriSaat[1])!)
        
        if (fark >= 15){
            FirebaseProcess.execute(interface: FirebaseAddVote(), data: self.dataHazirla())
            Musteri.getNesne().setOyTarihi(oyTarihi: guncelSaat)
            FirebaseProcess.execute(interface: FirebaseMasaOySaatGuncelle(), data: ["oySaati" : guncelSaat])
            Toast.make(mesaj: "Oy Kullanımınız Başarılı")
        }
        else{
            
            Toast.make(mesaj: (String(15 - fark)) + " Dakka Sonra Oy Kullanabilirsiniz")
        }
        
    }
    
    private func dataHazirla()->[String:String]{
        var data = [String:String]()
        data["muzikKey"] = MuzikList.getNesne().getAnahtar(index: self.secilenMuzikIndex)
        data["oy"] = String(MuzikList.getNesne().getMuzikOylari(index: self.secilenMuzikIndex) + 1)
        return data
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MuzikList.getNesne().getMuzikAdi().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "muzikCell", for: indexPath) as! MuziklerTableViewCellViewController
        cell.muzikAdi.text = MuzikList.getNesne().getMuzikAdi(index: indexPath.row)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.muzikLabel.text = MuzikList.getNesne().getMuzikAdi(index: indexPath.row)
        self.secilenMuzikIndex = indexPath.row
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
