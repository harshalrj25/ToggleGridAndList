//
//  ViewController.swift
//  ToggleGridAndList
//
//  Created by Harshal Jadhav on 08/05/17.
//  Copyright © 2017 Harshal Jadhav. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource{

    @IBOutlet weak var demoCollectionView: UICollectionView!
    let data = ["10","9","8","7","6","5","4","3","2","1","10","9","8","7","6","5","4","3","2","1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        demoCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = demoCollectionView.dequeueReusableCell(withReuseIdentifier: "demoCollectionViewCell", for: indexPath) as! demoCollectionViewCell
        cell.label1.text = "Row : \(indexPath.row)"
        cell.label2.text = "Digit : \(indexPath.row)"
        cell.imageView1.image = UIImage(named: data[indexPath.row] as String)
        return cell
    }

    func setLayout(layout:UICollectionViewLayout) {
        UIView.animate(withDuration: 0.5) { () -> Void in
            self.demoCollectionView.collectionViewLayout.invalidateLayout()
            self.demoCollectionView.setCollectionViewLayout(layout, animated: true)
        }
    }

    
    @IBAction func toggleClicked(_ sender: UIBarButtonItem) {
        var layout = ListFlowLayout() as UICollectionViewLayout
        if demoCollectionView.collectionViewLayout.classForCoder == layout.classForCoder {
             layout = GridFlowLayout() as UICollectionViewLayout
            
        }else{
             layout = ListFlowLayout() as UICollectionViewLayout
        }
        self.setLayout(layout: layout)
    }
    

}

