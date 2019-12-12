//
//  SetingsViewController.swift
//  Planets
//
//  Created by Chris Price on 12/11/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

protocol PlanetsSettingsDelegate: class {
    func shouldShowPlutoChanged()
}

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var plutoSwitch: UISwitch!
    
    weak var delegate: PlanetsSettingsDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateViews()
    }
    // MARK: - Action Handlers
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) { // Setting
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey )
        delegate?.shouldShowPlutoChanged()
    }
    
    private func updateViews() { // Getting
        // We are creating a "alias" for the UserDefaults here so we can manipulate that. But we could just write "UserDefaults.standard.bool" instead of "userDefaults.bool" after having defined userDefaults as UserDefaults.standard
        
        let userDefaults = UserDefaults.standard
        plutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
}

extension String {
    // "static var" is one that we can call on the class itself instead of only on an instance of the class. 
    static var shouldShowPlutoKey = "ShouldShowPluto"
}
