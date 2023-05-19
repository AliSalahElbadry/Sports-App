

import Foundation
import UIKit
import CoreData
protocol PDBManager{
    func saveNewFavorite(league:League)
    func deleteFavorite(leagueId:String,sportName:String)
    func getAllFavoriteLeagues()->Array<NSManagedObject>?
    func isFavorite(leagueId: String, sportName: String)->Bool
}
class DBManager : PDBManager{
    
    func saveNewFavorite(league: League) {
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        let manager:NSManagedObjectContext=appdelegate.persistentContainer.viewContext
        let entity=NSEntityDescription.entity(forEntityName: "FavoriteLeagues", in:manager)!
        let favoriteLeague=NSManagedObject(entity: entity, insertInto: manager)
        favoriteLeague.setValue(league.id, forKey: "id")
        favoriteLeague.setValue(league.name, forKey: "name")
        favoriteLeague.setValue(league.image, forKey: "image")
        favoriteLeague.setValue(league.sport, forKey: "sport")
        favoriteLeague.setValue(league.url, forKey: "url")
        do{
            try manager.save()
        }catch let e{
            print(e.localizedDescription)
        }
    }
    
    func deleteFavorite(leagueId: String, sportName: String) {
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        let manager:NSManagedObjectContext=appdelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        do{
            var favLeagues=try manager.fetch(fetchRequest)
            favLeagues.forEach({it in
                if it.value(forKey: "id") as! String==leagueId{
                    if it.value(forKey: "sport") as! String==sportName{
                        manager.delete(it)
                    }
                }
            })
            try manager.save()
        }catch let e{
            print(e.localizedDescription)
        }
    }
    func isFavorite(leagueId: String, sportName: String)->Bool {
        var isFav:Bool = false
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        let manager:NSManagedObjectContext=appdelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        do{
            var favLeagues=try manager.fetch(fetchRequest)
            favLeagues.forEach({it in
                if it.value(forKey: "id") as! String==leagueId{
                    if it.value(forKey: "sport") as! String==sportName{
                       isFav = true
                    }
                }
            })
        }catch let e{
            print(e.localizedDescription)
        }
        return isFav
    }
    func getAllFavoriteLeagues() ->Array<NSManagedObject>? {
        var favLeagues:Array<NSManagedObject>?
        let appdelegate=UIApplication.shared.delegate as! AppDelegate
        let manager:NSManagedObjectContext=appdelegate.persistentContainer.viewContext
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        do{
            favLeagues=try manager.fetch(fetchRequest)
        }catch let e{
            print(e.localizedDescription)
        }
        return favLeagues
    }
}
