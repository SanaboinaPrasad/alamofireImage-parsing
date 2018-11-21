//
//  NetworkHandler.swift
//  tableImage
//
//  Created by Sriram Prasad on 21/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import Alamofire

class Neworkhandler {
    typealias  webservice = ([[String:Any]]?,Error?)-> Void
    
    func execute(_ url: URL, completionHandler: @escaping webservice) {
        
        Alamofire.request(url).validate().responseJSON { ( response) in
            if let  error = response.error{
                print(error)
                completionHandler(nil,error)
            }
            else if let jsonArray = response.result.value as?[[String: Any]]   {
                completionHandler(jsonArray,nil)
            }
            else if let jsondict = response.result.value as? [String: Any] {
                completionHandler([jsondict],nil)
            }
        }
        
    }
    
}
