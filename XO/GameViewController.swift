//
//  GameViewController.swift
//  XO
//
//  Created by Admin on 07.01.2021.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let layout: CustomCollectionLayout = CustomCollectionLayout.init()
    var displayHeight: CGFloat = 0.0
    var displayWidth: CGFloat = 0.0
    var gameCollectionView: UICollectionView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayHeight = self.view.frame.height
        displayWidth = self.view.frame.width
        gameCollectionView = UICollectionView(frame: CGRect(x: 0, y: (displayHeight - displayWidth) / 2, width: displayWidth, height: displayWidth),collectionViewLayout: layout )
        gameCollectionView?.dataSource = self
        gameCollectionView?.delegate = self
        gameCollectionView?.register( GameCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
      
        
       // gameCollectionView!.backgroundColor = .green
        self.view.addSubview(gameCollectionView!)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GameCollectionViewCell
        cell.configurate()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print ("you click on cell N", indexPath.row)
        //collectionView.cellForItem(at: indexPath)?.image.image = UIImage(named: "iconX")
        
        
    }
        
   
    
}
