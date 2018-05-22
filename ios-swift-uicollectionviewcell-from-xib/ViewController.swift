//
//  ViewController.swift
//  ios-swift-uicollectionviewcell-from-xib
//
//  Created by demo on 5/20/18.
//  Copyright © 2018 VNCode247. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let productCollectionViewCellId = "ProductCollectionViewCell"
    
    var products = [ProductDto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // register cell
        let nibCell = UINib(nibName: productCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCellId)
        
        // init data
        for _ in 1...25 {
            let product = ProductDto()
            product?.name = "Wireless Headphone"
            product?.desc = "Hear the music, Not the noise ;)"
            products.append(product!)
        }
        collectionView.reloadData()
    }
}

// Code for collectionview
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCellId, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.img.image = UIImage(named: "img_product")
        cell.lbName.text = product.name!
        cell.lbDesc.text = product.desc!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) - \(product.name!)")
    }
}





































