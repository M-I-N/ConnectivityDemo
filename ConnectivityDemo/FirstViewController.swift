//
//  FirstViewController.swift
//  ConnectivityDemo
//
//  Created by Nayem on 1/2/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import UIKit
import Connectivity

class FirstViewController: UIViewController, ConnectivityNotifiable {
    
    let connectivity = Connectivity()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Navigation bar modification
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
        title = "Home"
        startNotifyingConnectivityChangeStatus()
    }
    
    deinit {
        stopNotifyingConnectivityChangeStatus()
    }

    func connectivityChanged(toStatus: ConnectivityStatus) {
        switch toStatus {
            
        case .connected, .connectedViaWiFi, .connectedViaCellular:
            navigationController?.navigationBar.barTintColor = .green
        
        case .notConnected, .connectedViaWiFiWithoutInternet, .connectedViaCellularWithoutInternet:
            navigationController?.navigationBar.barTintColor = .red
        }
    }

}

