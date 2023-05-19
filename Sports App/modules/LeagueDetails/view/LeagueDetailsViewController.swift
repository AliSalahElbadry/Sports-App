//
//  LeagueDetailsViewController.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import UIKit

protocol PLeagueDetailsViewController{
    func refrishUserInterface()
}
class LeagueDetailsViewController: UIViewController, PLeagueDetailsViewController {
    func refrishUserInterface() {
        
    }
    
    private var viewModel : LeaugeDetailsViewModel?
    var league:League?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LeagueDetailsDependancyFactory.viewModel(league: self.league!, pleagueDetails: self)
        viewModel?.prepareLeageDetails()
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
