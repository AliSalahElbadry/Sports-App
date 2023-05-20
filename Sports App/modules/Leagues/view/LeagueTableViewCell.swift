//
//  LeagueTableViewCell.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    
    @IBOutlet weak var leagueImg: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }

}
