//
//  VKService.swift
//  vk
//
//  Created by Ksenia on 10.12.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

class VKService {
    let baseUrl = "https://api.vk.com/method"
    
    func getFriends(completion: @escaping ([User]) -> Void){
        
        let path = "/friends.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00",
            "fields": "photo_200_orig"
        ]
        // https://api.vk.com/method/friends.get?access_token=1ea08d690aa26a541771c17b304c1be12c79e522e13d0575b0c623c728f8d51679af9ab6f2c65edaa8438&user_id=566604693&v=5.00
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            switch repsonse.result {
                case let .success(data):
                    let json = JSON(data)
                    var users:[User] = []
                    for item in json["response"]["items"] {
                        let strUrl: String = item.1["photo_200_orig"].stringValue
                        let firstName: String = item.1["first_name"].stringValue
                        let lastName: String = item.1["last_name"].stringValue
                        let id: String = item.1["id"].stringValue
                        users.append(User(photoLink: strUrl, firstName: firstName, lastName: lastName, id: id))
                        completion(users)
                    }
                case .failure(_):
                    print ("error request")
            }
//            print ("===")
//            print(repsonse.value!)
//            print ("===")
        }
    }
    func getPhotos(id: String, completion: @escaping ([String]) -> Void){
        
        let path = "/photos.getAll"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "owner_id": id,
            "v": "5.00"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
                    switch repsonse.result {
                        case let .success(data):
                            print ("success")
                            let json = JSON(data)
                            var photos:[String] = []
                            for item in json["response"]["items"] {
                                let strUrl: String = item.1["photo_807"].stringValue
                                photos.append(strUrl)
                                completion(photos)
                            }
                        case .failure(_):
                            print ("error request")
                    }
//                    print ("===")
//                    print(repsonse.value!)
//                    print ("===")
                }
    }
    func listGroups(completion: @escaping ([Group]) -> Void){
        
        let path = "/groups.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00",
            "extended": "1"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
            switch repsonse.result {
                case let .success(data):
                    print ("success")
                    let json = JSON(data)
                    var groups:[Group] = []
                    for item in json["response"]["items"] {
                        let name: String = item.1["name"].stringValue
                        let url: String = item.1["photo_100"].stringValue
                        groups.append(Group(photoLink: url, name: name))
                        completion(groups)
                    }
                case .failure(_):
                    print ("error request")
            }
            
        }
       
    }
    func searchGroups(str: String, completion: @escaping ([Group]) -> Void){
        
        let path = "/groups.search"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "q": str,
            "v": "5.00"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
            switch repsonse.result {
                case let .success(data):
                    print ("success")
                    let json = JSON(data)
                    var groups:[Group] = []
                    for item in json["response"]["items"] {
                        let name: String = item.1["name"].stringValue
                        let url: String = item.1["photo_100"].stringValue
                        groups.append(Group(photoLink: url, name: name))
                        completion(groups)
                    }
                case .failure(_):
                    print ("error request")
            }
        }
    }
}
