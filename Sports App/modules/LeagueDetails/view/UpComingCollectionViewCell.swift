//
//  UpComingCollectionViewCell.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var upComingLabel: UILabel!
    
    @IBOutlet weak var homeTeamImageView: UIImageView!
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    
    @IBOutlet weak var eventDateLabel: UILabel!
    
    @IBOutlet weak var awayTeamImageView: UIImageView!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    @IBOutlet weak var eventTimeLabel: UILabel!
    
    
    
    func configureCell(homeTitle : String , awayTitle : String , eventDate : String , homeLogo : String , awaylogo : String , eventTime : String){
        
        self.layer.cornerRadius = 25
        
        homeTeamLabel.text = homeTitle
        awayTeamLabel.text = awayTitle
        eventDateLabel.text = eventDate
        eventTimeLabel.text = eventTime
        let urlHome = URL(string: homeLogo)
        homeTeamImageView.kf.setImage(with: urlHome)
        homeTeamImageView.kf.indicatorType = .activity
        let urlAway = URL(string: awaylogo)
        awayTeamImageView.kf.setImage(with: urlAway)
        
    }
}
