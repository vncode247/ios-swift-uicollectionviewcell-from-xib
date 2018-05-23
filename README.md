[![Watch the video](https://i.imgur.com/L0i2Zpd.png)](https://youtu.be/P9V8C5lfPUk)

# ios-swift-uicollectionviewcell-from-xib
How to do that? Just follow these easy steps
>#### 1. Add UICollectionView - remember add datasource and delegate 
>><img src="https://i.imgur.com/05zb1gj.png" width="350px">

>#### 2. Add custom cell - remember set Identifier value 
>><img src="https://i.imgur.com/5KVlVCH.png" width="250px">

>#### 3. Init data
```swift
    @IBOutlet weak var collectionView: UICollectionView!
    let productCollectionViewCellId = "ProductCollectionViewCell"
    var products = [ProductDto]()
```

```swift
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
```

```swift
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
```
