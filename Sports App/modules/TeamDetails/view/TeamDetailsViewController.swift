//
//  TeamDetailsViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var playersTable: UITableView!
    @IBOutlet weak var teamImg: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var league:League?
    var team:Team?
    var viewModel:TeamDetailsViewModel?
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if Network.reachability.isConnectedToNetwork == true{
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = view.center
            activityIndicator.startAnimating()
            playersTable.delegate = self
            playersTable.dataSource = self
            teamName.text = team?.name
            teamImg.kf.setImage(with: URL(string:team?.image ?? ""))
            viewModel = TeamDetailsViewModelDependancyFactory.viewModel(sportName: league?.sport ?? "", teamId: String(team?.teamKey ?? 0))
            viewModel?.refrishTeamDetails = {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.playersTable.reloadData()
            }
            viewModel?.fetchTeam()
        }else{
            Alerts().showAlert(msg: "Opps !! Lost Connection ",complitionHandeler: {
                self.dismiss(animated: true)
            })
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(league?.sport == "football")
        {
            return viewModel?.footTeam?.players?.count ?? 0
        }else if(league?.sport == "basketball")
        {
            return 0
        }else if(league?.sport == "cricket")
        {
            return 0
        }else {
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerscell", for: indexPath) as! PlayerTableViewCell
        
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        cell.contentView.layer.borderWidth = 0.3
        cell.contentView.layer.cornerRadius = 20
        cell.clipsToBounds = true
        if( league?.sport == "football")
        {
            let player =  viewModel?.footTeam?.players?[indexPath.row]
            cell.playerName.text = player?.playerName ?? "Unknown"
            cell.playerNumber.text = player?.playerNumber ?? "Unknown"
            cell.playerImg.layer.cornerRadius = 25
            cell.playerImg.layer.masksToBounds = true
            cell.playerImg.clipsToBounds = true
            
            let string = player?.playerImage
            if let s = string{
                cell.playerImg.kf.setImage(with: URL(string: s))
            }else{
                cell.playerImg.image = UIImage(named: "soccer-player")
            }
        }else if( league?.sport == "tennis")
        {
            let player =  viewModel?.tennisTeam
            cell.playerName.text = player?.playerName ?? "Unknown"
            cell.playerNumber.text = player?.playerBday ?? "Unknown"
            
            let string = player?.playerLogo
            if let s = string{
                cell.playerImg.kf.setImage(with: URL(string: s))
            }else{
                cell.playerImg.image = UIImage(named: "soccer-player")
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
