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

class VKService {
    let baseUrl = "https://api.vk.com/method"
    
    func getFriends(completion: @escaping ([User]) -> Void){
        
        let path = "/friends.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00"
        ]
        // https://api.vk.com/method/friends.get?access_token=91c78b2e94759cf2fef161cd3220a688b42f03c34ce15797b1f8449f2018a120ed76d5ef5258444ea31d6&user_id=566604693&v=5.00
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            switch repsonse.result {
                case let .success(data):
                    let json = JSON(data)
                    print ("---")
                    print (json["response"]["count"])
                    print ("---")
                case .failure(_):
                    print ("error request")
            }
            print ("===")
//            print(repsonse.value!)
            print(repsonse.value!)
            print ("===")
        }
    }
    func getPhotos(){
        
        let path = "/photos.getAll"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "owner_id": Session.instance.userId,
            "v": "5.00"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
    func listGroups(){
        
        let path = "/groups.get"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
            switch repsonse.result {
                case let .success(data):
                    let json = JSON(data)
                    print ("---")
                    print (json["response"]["count"])
                    print ("---")
                case .failure(_):
                    print ("error request")
            }
            
        }
       
    }
    func searchGroups(str: String){
        
        let path = "/groups.search"
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "q": str,
            "v": "5.00"
        ]
        
        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
}
