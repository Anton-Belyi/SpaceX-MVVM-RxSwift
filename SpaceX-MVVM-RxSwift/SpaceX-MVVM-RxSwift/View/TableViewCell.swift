//
//  TableViewCell.swift
//  SpaceX-MVVM-RxSwift
//
//  Created by Антон Белый on 08.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "cellID"
    
    var spaceshipNameLabel = UILabel()
    var spaceshipSubtitle = UILabel()
    var spaceImage = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        spaceImage.frame = CGRect(x: 16, y: 12, width: 36, height: 36)
        spaceImage.layer.cornerRadius = 18
        spaceImage.clipsToBounds = true
        contentView.addSubview(spaceImage)
        
        spaceshipNameLabel.frame = CGRect(x: spaceImage.frame.width + 26, y: 11, width: 320, height: 16)
        spaceshipNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(spaceshipNameLabel)
        
        spaceshipSubtitle.frame = CGRect(x: spaceImage.frame.width + 26, y: spaceshipNameLabel.frame.size.height + 19, width: 270, height: 16)
        spaceshipSubtitle.font = spaceshipSubtitle.font.withSize(14)
        contentView.addSubview(spaceshipSubtitle)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: TO DO
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
