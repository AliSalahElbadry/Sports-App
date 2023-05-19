//
//  TeamDetailsViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit

protocol PTeamDetailsViewController{
    func refrishTeamDetails()
}
class TeamDetailsViewController: UIViewController,PTeamDetailsViewController {
   
    var league:League?
    var team:Team?
    var viewModel:TeamDetailsViewModel?
    func refrishTeamDetails() {
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TeamDetailsViewModelDependancyFactory.viewModel(sportName: league?.sport ?? "", pTeamDetailsViewController: self, teamId: String(team?.teamKey ?? 0))
        viewModel?.fetchTeam()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
