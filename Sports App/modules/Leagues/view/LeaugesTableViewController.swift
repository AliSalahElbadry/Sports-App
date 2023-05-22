//
//  LeaugesTableViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit
import Kingfisher

class LeaugesViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var viewModel: LeaguesViewModel?
    var sportName:String?
    @IBAction func backIsPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        
        view.addSubview(activityIndicator)
        viewModel =  LeaguesDependancyFactory.viewModel(sportName: sportName ?? "football")
        viewModel?.showLeagues = {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.tableView.reloadData()
        }
        if Network.reachability.isConnectedToNetwork == true{
            viewModel?.getLeagues()
        }else{
            Alerts().showAlert(msg: "Opps !! No Network Connection",complitionHandeler: {
                self.dismiss(animated: true)
            })
        }
        if(sportName == "football"){
            self.title = "Football leagues"
        }else if(sportName == "basketball"){
            self.title = "Basketball leagues"
        }else if(sportName == "cricket"){
            self.title = "Cricket leagues"
        }else{
            self.title = "Tennis leagues"
        }
       
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.leagues?.count ?? 0
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        
        cell.leagueLabel.text = viewModel?.leagues?[indexPath.row].name
       
        switch sportName {
        case "football" :
            var str = viewModel?.leagues?[indexPath.row].image
            let predicate = NSPredicate(format:"SELF ENDSWITH[c] %@", ".png")
            let result = predicate.evaluate(with: str)
            
            //MARK: - kingfisher
            if result{
                let url = URL(string: str!)
                cell.leagueImg.kf.setImage(with: url)
                
                
            }else{
                cell.leagueImg.image = UIImage(named: "football")
            }
        case "basketball" :
            cell.leagueImg.image = UIImage(named: "NewBasketball")
        case "cricket" :
            cell.leagueImg.image = UIImage(named: "NewCricket")
        case "tennis" :
            cell.leagueImg.image = UIImage(named: "tennis")
        default:
            break
        }
 
        return cell
    }
    

     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetailsPage = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        let league = viewModel?.leagues?[indexPath.row]
        let image = (tableView.cellForRow(at: indexPath) as! LeagueTableViewCell).leagueImg.image
         league?.image = image?.jpegData(compressionQuality : 1)?.base64EncodedString() ?? ""
         leagueDetailsPage.league = league
         leagueDetailsPage.modalTransitionStyle = .crossDissolve
        leagueDetailsPage.modalPresentationStyle = .fullScreen
        self.present(leagueDetailsPage, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
