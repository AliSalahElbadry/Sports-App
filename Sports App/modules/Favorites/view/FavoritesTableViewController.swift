//
//  FavoritesTableViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit


class FavoritesTableViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var favoriteViewModel : FavoritesViewModel?
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        favoriteViewModel = FavoriteDependancyFactory.viewModel()
        favoriteViewModel?.showFavorites = {
            self.tableView.reloadData()
        }
        favoriteViewModel?.getAllFavoriteLeagues()
    }
    override func viewWillAppear(_ animated: Bool) {
        favoriteViewModel?.getAllFavoriteLeagues()
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favoriteViewModel?.favorites?.count ?? 0
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell") as! FavoritesTableViewCell
        cell.leagueName.text = favoriteViewModel?.favorites?[indexPath.row].name
         if let txt = favoriteViewModel?.favorites?[indexPath.row].sport {
             var result = ""
             if( txt == "football")
             {
                 result = "Football"
             }else if(txt == "basketBall")
             {
                 result = "BasketBall"
             }else if (txt == "cricket")
             {
                 result = "Cricket"
             }else{
                 result = "Tennis"
             }
             cell.leagueSport.text = result
             
         }
        cell.leagueImage.image = convertStringToImage(string: favoriteViewModel?.favorites?[indexPath.row].image ?? "")
        cell.contentView.layer.borderColor = UIColor.darkGray.cgColor
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
        return cell
    }
    func convertStringToImage(string:String)->UIImage{
        let imageData = Data(base64Encoded: string)
        let image = UIImage(data: imageData!)
        return image!
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Delete") { [weak self] (action, view, completionHandler) in
            self?.handleDeleteFavourite(index: indexPath.row)
                                            completionHandler(true)
        }
        action.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func handleDeleteFavourite(index:Int){
        let alert = UIAlertController(title: "Alert", message: "remove this league from favorites ", preferredStyle: UIAlertController.Style.alert)
        let yesAction = UIAlertAction(title: "yes", style: .default) { it in
            
            self.favoriteViewModel?.deleteFavorite(leagueId: index)
            alert.dismiss(animated: true)
            
        }
        let noAction = UIAlertAction(title: "no", style: .default) { it in
            alert.dismiss(animated: true)
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        alert.present(animated: true, completion: {
        })
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Network.reachability.isConnectedToNetwork == true{
            let leagueDetailsPage = self.storyboard?.instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
            leagueDetailsPage.league = favoriteViewModel?.favorites?[indexPath.row]
            leagueDetailsPage.modalTransitionStyle = .crossDissolve
            leagueDetailsPage.modalPresentationStyle = .fullScreen
            self.present(leagueDetailsPage, animated: true)
        }else{
            Alerts().showAlert(msg: "You Are Offline !!")
        }
    }
}
