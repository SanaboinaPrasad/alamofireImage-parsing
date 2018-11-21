//
//  TCell.swift
//  tableImage
//
//  Created by Sriram Prasad on 21/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class TCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var ieLabel: UILabel!
    @IBOutlet weak var albumslabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
