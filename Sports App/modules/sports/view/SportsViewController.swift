//
//  SportsCollectionView.swift
//  Sports App
//
//  Created by Mac on 17/05/2023.
//

import UIKit

class SportsViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var colView: UICollectionView!
    var sportsArr = [Sports]()
    override func viewDidLoad() {
        super.viewDidLoad()
        colView.delegate=self
        colView.dataSource=self
        self.title = "Sports"
        sportsArr.append(Sports(sportName: "FootBall", sportPhoto: UIImage(named: "football")!))
        sportsArr.append(Sports(sportName: "BasketBall", sportPhoto: UIImage(named: "NewBasketball")!))
        sportsArr.append(Sports(sportName: "Cricket", sportPhoto: UIImage(named: "NewCricket")!))
        sportsArr.append(Sports(sportName: "Tennis", sportPhoto: UIImage(named: "tennis")!))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as! SportCollectionViewCell
        let sport = sportsArr[indexPath.row]
        cell.setCell(name: sport.sportName, photo: sport.sportPhoto)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: self.view.frame.width * 0.493, height: self.view.frame.width * 0.49)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 120, left: 1, bottom: 20, right: 1)
    }
    
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaugesPage = self.storyboard?.instantiateViewController(withIdentifier: "LeaguesTableViewController") as! LeaugesTableViewController
        leaugesPage.modalTransitionStyle = .crossDissolve
        leaugesPage.modalPresentationStyle = .fullScreen
        switch (indexPath.row){
        case 0 :
            leaugesPage.sportName="football"
            
            break
        case 1:
            leaugesPage.sportName="basketball"
            break
        case 2:
            leaugesPage.sportName="cricket"
            break
        default :
            leaugesPage.sportName="tennis"
            break
        }
        self.present(leaugesPage, animated: true)
    }
    
  
}


struct Sports {
    var sportName : String
    var sportPhoto : UIImage
    
}
