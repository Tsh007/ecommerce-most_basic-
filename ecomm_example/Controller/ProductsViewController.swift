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
    
    var idxSelected = 0

    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.register(UINib(nibName: "userCell", bundle: nil),forCellReuseIdentifier: "userCell")
        viewModelUser.vc = self
        viewModelUser.getData()
        
        tblView.dataSource = self
        tblView.delegate = self
    }

}

extension ProductsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? userCell
        
        let modelProducts = viewModelUser.arrProducts[indexPath.row]
        
        
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
        
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Products List"
    }
    
}

extension ProductsViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idxSelected = indexPath.row
        self.performSegue(withIdentifier: "goToDetailProduct", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let modelProducts = viewModelUser.arrProducts[idxSelected]
        let destinationVC = segue.destination as! DetailViewController
        
        destinationVC.arrProducts = [modelProducts]
    }
    
    
    
}
