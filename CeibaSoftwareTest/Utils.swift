//
//  Utils.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 6/10/22.
//

import Foundation

class Utils {
    static func checkInternetConnection() -> Bool{
        var flag = false
        let reachability = Reachability()
        switch reachability?.connection {
        case .wifi, .cellular:
            flag = true
        default:
            flag = false
        }
        return flag
    }
    
    static func checkDataOrWifi() -> Reachability.Connection {
        guard let reachability = Reachability() else {
            return .none
        }
        return reachability.connection
    }
    
}
