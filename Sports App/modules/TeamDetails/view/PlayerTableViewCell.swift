//
//  PlayerTableViewCell.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var playerName: UILabel!
   
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }

}
