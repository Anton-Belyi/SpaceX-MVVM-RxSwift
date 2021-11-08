//
//  Model.swift
//  SpaceX-MVVM-RxSwift
//
//  Created by Антон Белый on 07.11.2021.
//

import Foundation

struct SpaceShip: Codable {
    let flightNumber: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case name
    }
}
