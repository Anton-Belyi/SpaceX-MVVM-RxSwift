//
//  ViewModel.swift
//  SpaceX-MVVM-RxSwift
//
//  Created by Антон Белый on 07.11.2021.
//

import Alamofire
import RxCocoa
import RxSwift

class ViewModel {
    
    var spaceX = PublishSubject<[SpaceShip]>()
 
    func fetchSpaceShip() {
            AF.request("https://api.spacexdata.com/v4/launches").response { response in
                do {
                    let data = try JSONDecoder().decode([SpaceShip].self, from: response.data!)
                    self.spaceX.onNext(data)
                    self.spaceX.onCompleted()
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        }
    }


