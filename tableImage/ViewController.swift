//
//  ViewController.swift
//  tableImage
//
//  Created by Sriram Prasad on 21/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    var listarray = [[String:Any]]()
let networkInstance = Neworkhandler()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TCell
         let indexlist = listarray[indexPath.row]
        let id = indexlist["id"] as? Int
        let abmid = indexlist["albumId"] as? Int
        cell.albumslabel.text = indexlist["title"] as? String
        cell.ieLabel.text =  "\(id ?? 0)"
        cell.titleLabel.text = "\(abmid ?? 0)"
        if let  profileurl = indexlist["url"] as? String {
            if let  thumbnailimageview = indexlist["thumbnailUrl"] as? String {
                    Alamofire.request(profileurl).responseImage(completionHandler: { (reponse) in
                        if let profileimage =  reponse.result.value {
                            Alamofire.request(thumbnailimageview).responseImage(completionHandler: { (reponse) in
                                if let thumbnailImageview =  reponse.result.value {
                                    
                            DispatchQueue.main.async {
                                cell.profileImageView.image = profileimage
                            cell.thumbnailImageView.image = thumbnailImageview
//
                                    }
                                    
                                }
                                
                            })
                        }
                    })
            cell.profileImageView.image = UIImage(named: "bill")
            cell.thumbnailImageView.image = UIImage(named: "bill")
            }
        }
        return cell

        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    @IBAction func sendRequest(_ sender: Any) {
        datarequest()
        tableView.reloadData()
    }
    func datarequest(){
        guard let urltoexecute = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        networkInstance.execute(urltoexecute) { (json, error) in
            if  let error = error {
                print(error.localizedDescription)
            }
                
            else if let json = json  {
                self.listarray = json
                self.tableView.reloadData()
            }
        }
    }


}


