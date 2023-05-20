//
//  TeamCollectionViewCell.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var teamImage: UIImageView!
    
    func setupCellforteams(photo:UIImage){
        teamImage.image = photo
    }
}
