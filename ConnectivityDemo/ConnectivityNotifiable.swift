//
//  ConnectivityNotifiable.swift
//  ConnectivityDemo
//
//  Created by Nayem on 1/2/19.
//  Copyright © 2019 Mufakkharul Islam Nayem. All rights reserved.
//

import Foundation
import Connectivity

protocol ConnectivityNotifiable {
    
    var connectivity: Connectivity { get }
    
    /// Adds the behavior to be able to listen for Connectivity status change event with 10 second polling mechanism.
    
    /// Default implementation available, inorder to have the default behavior just invoke this function.
    func startNotifyingConnectivityChangeStatus()
    
    /// Adds the behavior to be opt out from listening Connectivity status change event.
    
    /// Default implementation available, inorder to have the default behavior just invoke this function.
    func stopNotifyingConnectivityChangeStatus()
    
    
    /// Callback method when ConnectivityStatus is changed. Performed on main queue.
    ///
    /// - Parameter toStatus: ConnectivityStatus at the moment of call back.
    func connectivityChanged(toStatus: ConnectivityStatus)
}

extension ConnectivityNotifiable {
    func startNotifyingConnectivityChangeStatus() {
        connectivity.isPollingEnabled = true
        connectivity.startNotifier()
        connectivity.whenConnected = { connectivity in
            self.connectivityChanged(toStatus: connectivity.status)
        }
        connectivity.whenDisconnected = { connectivity in
            self.connectivityChanged(toStatus: connectivity.status)
        }
    }
    func stopNotifyingConnectivityChangeStatus() {
        connectivity.stopNotifier()
    }
}
