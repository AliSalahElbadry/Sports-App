//
//  FavoritesTableViewCell.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueSport: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }

    
}
