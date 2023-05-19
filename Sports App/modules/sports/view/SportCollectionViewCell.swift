//
//  SportCollectionViewCell.swift
//  Sports App
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var sportLabel: UILabel!
    
    
    
    func setCell(name : String , photo : UIImage){
        
        imageV.image = photo
        sportLabel.text = name
    }
    
}
