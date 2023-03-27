//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Buhtan on 27.03.2023.
//  Copyright © 2023 Buhtan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var chosenLandmarkNames = ""
    var chosenLandmarkImage = UIImage()
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
      
        landmarkNames.append("Colosseum")
        landmarkNames.append("GreatWall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonegenhe")
        landmarkNames.append("TajMahal")
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greatWall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonegenhe")!)
        landmarkImages.append(UIImage(named: "tajMahal")!)
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkImage = landmarkImages[indexPath.row]
        chosenLandmarkNames = landmarkNames [indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationtoDetailsVC = segue.destination as! DetailsVC
            destinationtoDetailsVC.selectedLandmarkNames = chosenLandmarkNames
            destinationtoDetailsVC.selectedLandmarkImages = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }


}

