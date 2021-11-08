//
//  ViewController.swift
//  SpaceX-MVVM-RxSwift
//
//  Created by Антон Белый on 07.11.2021.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private var tableView: UITableView!
    private let disposeBag = DisposeBag()
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SpaceX+RxSwift"
        configureTableView()
        viewModel.fetchSpaceShip()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        bindTableView()
    }
}


// MARK: Configure and bind TableViewCell
extension ViewController {
    
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        view.addSubview(tableView)
    }
    
    private func bindTableView() {
        viewModel.spaceX.bind(to: tableView.rx.items(cellIdentifier: TableViewCell.identifier, cellType: TableViewCell.self)) { (row, item, cell) in
            cell.spaceshipNameLabel.text = "Spaceship is:\(item.name)"
            cell.spaceshipSubtitle.text = "Number of spaceship is:\(item.flightNumber)"
            //MARK: TO DO
            cell.spaceImage.downloaded(from: "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png")
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(SpaceShip.self).subscribe { item in
            print(item)
        }.disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 65
        }
}
