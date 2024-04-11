//
//  UserViewModel.swift
//  ecomm_example
//
//  Created by Tejash Singh on 11/04/24.
//


import UIKit
import Alamofire

class UserViewModel{
    
    weak var vc: ProductsViewController?
    var arrUserModel = [UserModel]()
    var arrProducts = [Products]()
    
    
    func getData(){
        AF.request("https://dummyjson.com/products")
            .response{ response in
                if let data = response.data{
                    do{
                        let userResponse = try JSONDecoder().decode(UserModel.self,from: data)
                        if let products = userResponse.products{
                            self.arrProducts.append(contentsOf: products)
                        }
                        
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
            }
    }
    
    //using url session no need
        //    func getData(){
        //        URLSession.shared.dataTask(with: URL(string: "https://dummyjson.com/products")!) { (Data, response, error) in
        //            if error == nil{
        //                if let data = Data{
        //                    do{
        //                        let userResponse = try JSONDecoder().decode(UserModel.self,from: data)
        //                        if let products = userResponse.products{
        //                            self.arrProducts.append(contentsOf: products)
        //                        }
        //
        //                        DispatchQueue.main.async {
        //                            self.vc?.tblView.reloadData()
        //                        }
        //                    }catch let err{
        //                        print(err.localizedDescription)
        //                    }
        //                }
        //
        //            }else{
        //                print(error?.localizedDescription)
        //            }
        //        }.resume()
        //    }
        //
    
    
}
