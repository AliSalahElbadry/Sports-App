//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var TeamsLabel: UILabel!
    
    @IBOutlet weak var teamsCell: UICollectionView!
    
    @IBOutlet weak var upComingCell: UICollectionView!
    @IBOutlet weak var favoriteBtn: UIBarButtonItem!
    
    @IBOutlet weak var latestResultsCell: UICollectionView!
    
    
    var activityIndicator = UIActivityIndicatorView(style: .large)
    private var viewModel : LeaugeDetailsViewModel?
    var league:League?
    var isFavorite:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        if Network.reachability.isConnectedToNetwork == true{
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = view.center
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)
            viewModel = LeagueDetailsDependancyFactory.viewModel(league: self.league!)
            viewModel?.upcomingEventsReached = {
                self.viewModel?.fetchLatestEvents()
            }
            viewModel?.latestEventsReached = {
                self.viewModel?.prepareTeams()
            }
            viewModel?.refrishUserInterface = {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.upComingCell.reloadData()
                self.latestResultsCell.reloadData()
                self.teamsCell.reloadData()
            }
            viewModel?.fetchUpcomingEvents()
            viewModel?.isItFavorite = { it in
                self.isFavorite = it
                self.refrishFavorite()
            }
            viewModel?.isFavorite()
           
            teamsCell.dataSource = self
            teamsCell.delegate = self
            upComingCell.delegate = self
            upComingCell.dataSource = self
            latestResultsCell.delegate = self
            latestResultsCell.dataSource = self
        }else{
            Alerts().showAlert(msg: "Please Check Your Network Connection",complitionHandeler: {
                self.dismiss(animated: true)
            })
        }
    }
    func refrishFavorite(){
        if(isFavorite == true)
        {
            favoriteBtn.image = UIImage(systemName: "heart.fill")
            
        }else if(isFavorite == false)
        {
            favoriteBtn.image = UIImage(systemName: "heart")
        }
    }
    @IBAction func backBtnClicked(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @IBAction func favoriteAction(_ sender: UIBarButtonItem) {
        if( isFavorite == true)
        {
            isFavorite = false
            refrishFavorite()
            viewModel?.removeFromFavorite()
            
        }else if( isFavorite == false)
        {
            isFavorite = true
            refrishFavorite()
            viewModel?.addToFavorite()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // number of items for teams
        if collectionView == teamsCell {
                return viewModel?.teams?.count ?? 1
           
        }
        // number of items for upComing Event
        if collectionView == upComingCell {
            if league?.sport == Constants.football{
                return viewModel?.events?.footUpComingEvents?.count ?? 0
            }else if league?.sport == Constants.basketball{
                return viewModel?.events?.basketUpcomingEvents?.count ?? 0
            }else if league?.sport == Constants.cricket{
                return viewModel?.events?.cricketUpcomingEvents?.count ?? 0
            }else{
                return viewModel?.events?.tennisUpcomingEvents?.count ?? 0
            }
        }
        if league?.sport == Constants.football{
            return viewModel?.events?.footLatestEvents?.count ?? 0
        }else if league?.sport == Constants.basketball{
            return viewModel?.events?.basketLatestEvents?.count ?? 0
        }else if league?.sport == Constants.cricket{
            return viewModel?.events?.cricketLatestEvents?.count ?? 0
        }
        return viewModel?.events?.tennisLatestEvents?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cofiguration cell for Teams
        if collectionView == teamsCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teams", for: indexPath) as! TeamsCollectionViewCell
            //            cell.backgroundColor = UIColor.red
            
            if collectionView == teamsCell {

                    let url = URL(string: (viewModel?.teams?[indexPath.row].image) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                    cell.teamImage.kf.setImage(with: url)
                
            }
            return cell
        }
        
        // cofiguration  cell for upComing Event
        if collectionView == upComingCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComing", for: indexPath) as! UpComingCollectionViewCell
            cell.layer.borderColor = UIColor.darkGray.cgColor
            cell.layer.borderWidth = 0.5
            if (league?.sport == Constants.football){
                let event = viewModel?.events?.footUpComingEvents?[indexPath.row]
                              
                let urlHome = URL(string: (event?.homeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                let urlAway = URL(string: (event?.awayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.configureCell(homeTitle:event?.eventHomeTeam ?? "", awayTitle: event?.eventAwayTeam ?? "", eventDate: event?.eventDate ?? "" , homeLogo: event?.homeTeamLogo ?? "", awaylogo: event?.awayTeamLogo ?? "", eventTime:event?.eventTime ?? "")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                cell.awayTeamImageView.kf.setImage(with: urlAway)
                
            }else if league?.sport == Constants.basketball{
                let event = viewModel?.events?.basketUpcomingEvents?[indexPath.row]
                let urlHome = URL(string: (event?.eventHomeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                let urlAway = URL(string: (event?.eventAwayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.configureCell(homeTitle:event?.eventHomeTeam ?? "", awayTitle: event?.eventAwayTeam ?? "", eventDate: event?.eventDate ?? "" , homeLogo: event?.eventHomeTeamLogo ?? "", awaylogo: event?.eventAwayTeamLogo ?? "", eventTime:event?.eventTime ?? "")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                cell.awayTeamImageView.kf.setImage(with: urlAway)
            }else if league?.sport == Constants.cricket{
                let event = viewModel?.events?.cricketUpcomingEvents?[indexPath.row]
                let urlHome = URL(string: (event?.eventHomeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                let urlAway = URL(string: (event?.eventAwayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.configureCell(homeTitle:event?.eventHomeTeam ?? "", awayTitle: event?.eventAwayTeam ?? "", eventDate: event?.eventDate ?? "" , homeLogo: event?.eventHomeTeamLogo ?? "", awaylogo: event?.eventAwayTeamLogo ?? "", eventTime:event?.eventTime ?? "")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                cell.awayTeamImageView.kf.setImage(with: urlAway)
            }else{
                let event = viewModel?.events?.tennisUpcomingEvents?[indexPath.row]
                let urlHome = URL(string: (event?.eventFirstPlayerLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                let urlAway = URL(string: (event?.eventSecondPlayerLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.configureCell(homeTitle:event?.eventFirstPlayer ?? "", awayTitle: event?.eventSecondPlayer ?? "", eventDate: event?.eventDate ?? "" , homeLogo: event?.eventFirstPlayerLogo ?? "", awaylogo: event?.eventSecondPlayerLogo ?? "", eventTime:event?.eventTime ?? "")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                cell.awayTeamImageView.kf.setImage(with: urlAway)
            }
            return cell
        }else
        {
            // cofiguration  cell for Latest Results
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResults", for: indexPath) as! LatestResultsCollectionViewCell
            cell.layer.cornerRadius = 25
            cell.layer.borderColor = UIColor.darkGray.cgColor
            cell.layer.borderWidth = 0.3
            cell.clipsToBounds = true
            
            if league?.sport == Constants.football{
                let event = viewModel?.events?.footLatestEvents?[indexPath.row]
                cell.homeTeamLabel.text = event?.eventAwayTeam ?? ""
                cell.awayTeamLabel.text = event?.eventHomeTeam ?? ""
                
                let urlHome = URL(string: (event?.homeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                let urlAway = URL(string: (event?.awayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.awayTeamImageView.kf.setImage(with: urlAway)
                
                cell.eventDateLabel.text = event?.eventDate ?? ""
                cell.eventTimeLabel.text = event?.eventTime ?? ""
                cell.eventFinalResultLabel.text = event?.eventFinalResult ?? ""
                
            }else if league?.sport == Constants.basketball{
                let event = viewModel?.events?.basketLatestEvents?[indexPath.row]
                cell.homeTeamLabel.text = event?.eventHomeTeam ?? ""
                cell.awayTeamLabel.text = event?.eventAwayTeam ?? ""
                
                let urlHome = URL(string: (event?.eventHomeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                let urlAway = URL(string: (event?.eventAwayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.awayTeamImageView.kf.setImage(with: urlAway)
                
                cell.eventDateLabel.text = event?.eventDate ?? ""
                cell.eventTimeLabel.text = event?.eventTime ?? ""
                cell.eventFinalResultLabel.text = event?.eventFinalResult ?? ""
                
            }else if league?.sport == Constants.cricket{
                
                let event = viewModel?.events?.cricketLatestEvents?[indexPath.row]
                cell.homeTeamLabel.text = event?.eventHomeTeam ?? ""
                cell.awayTeamLabel.text = event?.eventAwayTeam ?? ""
                let urlHome = URL(string: (event?.eventHomeTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                let urlAway = URL(string: (event?.eventAwayTeamLogo) ?? "https://goplexe.org/wp-content/uploads/2020/04/placeholder-1.png")
                cell.awayTeamImageView.kf.setImage(with: urlAway)
                
                cell.eventDateLabel.text = event?.eventDate ?? ""
                cell.eventTimeLabel.text = event?.eventTime ?? ""
                cell.eventFinalResultLabel.text = event?.eventFinalResult ?? ""
                
            }else{
                let event = viewModel?.events?.tennisLatestEvents?[indexPath.row]
                cell.homeTeamLabel.text = event?.eventFirstPlayer
                cell.awayTeamLabel.text = event?.eventSecondPlayer
                
                let urlHome = URL(string: (event?.eventFirstPlayerLogo) ?? "https://i.ibb.co/G9YtDLp/tennis.jpg")
                cell.homeTeamImageView.kf.setImage(with: urlHome)
                let urlAway = URL(string: (event?.eventSecondPlayerLogo) ?? "https://i.ibb.co/G9YtDLp/tennis.jpg")
                cell.awayTeamImageView.kf.setImage(with: urlAway)
                
                cell.eventDateLabel.text = event?.eventDate
                cell.eventTimeLabel.text = event?.eventTime
                cell.eventFinalResultLabel.text = event?.eventFinalResult
                
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCell {
            if Network.reachability.isConnectedToNetwork == true{
                let teamDetailsPage = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
                teamDetailsPage.league = self.league
                teamDetailsPage.team = viewModel?.teams?[indexPath.row]
                teamDetailsPage.modalTransitionStyle = .crossDissolve
                teamDetailsPage.modalPresentationStyle = .fullScreen
                self.present(teamDetailsPage, animated: true)
            }else{
                Alerts().showAlert(msg: "Connection Error !!")
            }
        }
    }
}
