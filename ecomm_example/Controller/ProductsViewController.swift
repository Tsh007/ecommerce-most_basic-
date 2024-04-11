//
//  ProductsViewController.swift
//  ecomm_example
//
//  Created by Tejash Singh on 11/04/24.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController {

    var viewModelUser = UserViewModel()
    
//    var productData = [Products]()

    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "userCell", bundle: nil),forCellReuseIdentifier: "userCell")
        viewModelUser.vc = self
        viewModelUser.getData()
        
        tblView.dataSource = self
        
//
//        tblView.reloadData()
    }

}

extension ProductsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("viewController")
//        print(viewModelUser.arrProducts.count)
        viewModelUser.arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? userCell
        
        let modelProducts = viewModelUser.arrProducts[indexPath.row]
        
//        print(modelProducts)
//        print(modelProducts.title!)
        
        cell?.titleLabel.text = modelProducts.title
        cell?.priceLabel.text = "$\(modelProducts.price ?? 0)"
        cell?.descLabel.text = modelProducts.description

        
        
        //this should be in viewModel as due to lack of time usign here
        AF.request(modelProducts.images![0]).response{response in
            if let data = response.data, let image = UIImage(data: data){
                DispatchQueue.main.async {
                    cell?.productImage.image = image
                }
                
            }
        }
        
        
        //using url session
//        let task = URLSession.shared.dataTask(with: URL(string: modelProducts.images![0])!) { Data, response, error in
//            if let data = Data, let image = UIImage(data: data){
//                DispatchQueue.main.async {
//                    cell?.productImage.image = image
//                }
//                
//            }
//        }.resume()
//        cell?.productImage.image = UIImage()
        
        return cell!
    }
    

    
    
}
