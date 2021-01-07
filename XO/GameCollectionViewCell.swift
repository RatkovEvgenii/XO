//
//  GameCollectionViewCell.swift
//  XO
//
//  Created by Admin on 07.01.2021.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
   // let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    func configurate() {
        let image = UIImageView(frame: self.bounds)
        self.addSubview(image)
        self.backgroundColor = .systemBackground
    }
    
}
