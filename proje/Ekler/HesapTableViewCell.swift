//
//  HesapTableViewCell.swift
//  proje
//
//  Created by memo on 4.05.2019.
//  Copyright © 2019 Proje. All rights reserved.
//

import UIKit

class HesapTableViewCell: UITableViewCell {

    @IBOutlet weak var adetLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var urunLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
