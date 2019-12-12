//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Chris Price on 12/11/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UICollectionViewController, PlanetsSettingsDelegate {

    // MARK: Properties
    
    let planetController = PlanetController()
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as? PlanetCollectionViewCell else { return UICollectionViewCell() }
        
        let planet = planetController.planets[indexPath.item]
        
        cell.imageView.image = planet.image
        cell.textLabel.text = planet.name
    
        return cell
    }

    func shouldShowPlutoChanged() {
        self.collectionView.reloadData() //Just calls the data protocols again
    }

    // MARK: - Naviation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSettings" {
            if let settingsVC = segue.destination as? SettingsViewController {
                settingsVC.delegate = self
            }
        }
    }
}
