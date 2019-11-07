//
//  API.swift
//  projectV1
//
//  Created by Mohamed Samir on 9/22/19.
//  Copyright © 2019 Mohamed Samir. All rights reserved.
//

import Foundation
import Alamofire

class API: NSObject {

    
    /////////////////////////////////////////////////////////////////////////////////////////////////
    // post function
    class func post<T:Codable>(_ url:String,parameter:[String:Any]?,headers:[String:String]?,completion: @escaping (_ check:Bool,_ response:T?)->Void){
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess{
                guard let data = response.data else {print("Can't get data from the server");return}
                do {
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(true,jsonResponse)
                }catch{
                    print(error)
                    completion(false,nil)
                }
            }else {
              print("check your internet connection")
                completion(false,nil)
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////
    //get function
    class func get<T:Codable>(url:String,parameter:[String:Any]?,headers:[String:String]?,completion:@escaping(_ check:Bool ,_ response:T?)->Void){
        Alamofire.request(url, method: .get, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if response.result.isSuccess{
                guard let data = response.data else {print("Can't get data from the server");return}
                do {
                    let jsonResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(true,jsonResponse)
                }catch{
                    print(error)
                    completion(false,nil)
                }
            }else{
                print("check your internet connection")
                completion(false,nil)
            }
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////
}
