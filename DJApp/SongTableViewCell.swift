//
//  SongTableViewCell.swift
//  DJApp
//
//  Created by Nguyen Do on 7/21/17.
//  Copyright © 2017 Gametime. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var newImageView: UIImageView!
    var funImage: UIImage = #imageLiteral(resourceName: "background")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newImageView.image = funImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
