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
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        playersTable.delegate = self
        playersTable.dataSource = self
        teamName.layer.cornerRadius = 20.0
        teamName.layer.borderWidth = 0.5
        teamName.layer.borderColor = UIColor.red.cgColor
        teamName.text = team?.name
        teamImg.kf.setImage(with: URL(string:team?.image ?? ""))
        viewModel = TeamDetailsViewModelDependancyFactory.viewModel(sportName: league?.sport ?? "", teamId: String(team?.teamKey ?? 0))
        viewModel?.refrishTeamDetails = {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.playersTable.reloadData()
        }
        viewModel?.fetchTeam()
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
        if( league?.sport == "football")
        {
            let player =  viewModel?.footTeam?.players?[indexPath.row]
            cell.playerName.text = player?.playerName ?? "Unknown"
            cell.playerNumber.text = player?.playerNumber ?? "Unknown"
            
            let string = player?.playerImage
            cell.playerImg.kf.setImage(with: URL(string: string ?? "https://www.pngkit.com/png/full/365-3654764_cristiano-ronaldo-icon-soccer-player-icon.png"))
           
        }else if( league?.sport == "tennis")
        {
            let player =  viewModel?.tennisTeam
            cell.playerName.text = player?.playerName ?? "Unknown"
            cell.playerNumber.text = player?.playerBday ?? "Unknown"
            
            let string = player?.playerLogo
            cell.playerImg.kf.setImage(with: URL(string: string ?? "https://www.pngkit.com/png/full/365-3654764_cristiano-ronaldo-icon-soccer-player-icon.png"))
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
