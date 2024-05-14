//
//  DetailViewController.swift
//  ecomm_example
//
//  Created by Tejash Singh on 13/05/24.
//


//learnings

//vimp how to make image resizable according to layout in ui kit
//https://sarunw.com/posts/how-to-resize-uiimageview-to-fit-container-view-using-auto-layout/
//vimp to fix the image size using the width and height constraints also decreasing the compression ratio 250 in place of 750 this will fit the image as per your need also set image to aspect fit
//in swiftui we don't need much and can do .resize


import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var pageView: UIPageControl!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    @IBOutlet var discountLbl: UILabel!
    @IBOutlet var categoryLbl: UILabel!
    @IBOutlet var brandLbl: UILabel!
    var arrProducts = [Products]()

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = arrProducts[0].title
        descLbl.text = arrProducts[0].description
        priceLbl.text = "Price: $\(arrProducts[0].price ?? 0)"
        discountLbl.text = "Discount: \(arrProducts[0].discountPercentage ?? 0.0) %"
        categoryLbl.text = arrProducts[0].category
        brandLbl.text = arrProducts[0].brand
        
        
        pageView.currentPage = 0
        pageView.numberOfPages = arrProducts[0].images?.count ?? 0
    }
    
    @IBAction func BackPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    @IBOutlet var collectionViewIB: UICollectionView!

    
}


extension DetailViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: collectionViewIB.frame.width, height: collectionViewIB.frame.height)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0.0
    }

}


extension DetailViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrProducts[0].images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewIB.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        AF.request(arrProducts[0].images![indexPath.row]).response{response in
            if let data = response.data, let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell.productImage.image = image
                }
                
            }
        }
        pageView.currentPage = indexPath.row
        
        
        return cell
    }
    
}
