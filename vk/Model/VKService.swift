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
    func getPhotos(id: String, completion: @escaping ([Photo]) -> Void){
        
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
                            var photos = [Photo]()
                            for item in json["response"]["items"] {
                                print (item)
                                let id: String = item.1["id"].stringValue
                                let ownerId: String = item.1["owner_id"].stringValue
                                let photoUrl: String = item.1["photo_807"].stringValue
                                photos.append(Photo(id: id, photoUrl: photoUrl, ownerId: ownerId ))
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
    func getNews(completion: @escaping ([News]) -> Void){
            
            let path = "/newsfeed.get"
            let parameters: Parameters = [
                "access_token": Session.instance.token,
                "v": "5.00",
                "count": "20",
                "filters": "post"
            ]
            
            let url = baseUrl+path
            
            AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
                switch repsonse.result {
                    case let .success(data):
                        let json = JSON(data)
                        print (json)
                        var news:[News] = []
                        var sourceName = [String: String]()
                        var sourcePhotoLink = [String: String]()
                        
                        
                        let dispatchGroup = DispatchGroup()
                        DispatchQueue.global().async(group: dispatchGroup) {
                            for profile in json["response"]["profiles"] {
                                let id: String = profile.1["id"].stringValue
                                sourceName[id] = profile.1["first_name"].stringValue + " " + profile.1["last_name"].stringValue
                                sourcePhotoLink[id] = profile.1["photo"].stringValue
                            }
                        }
                        DispatchQueue.global().async(group: dispatchGroup) {
                            for profile in json["response"]["groups"] {
                                let id: String = profile.1["id"].stringValue
                                sourceName[id] = profile.1["name"].stringValue
                                sourcePhotoLink[id] = profile.1["photo_50"].stringValue
                            }
                        }
                        
                        dispatchGroup.notify(queue: DispatchQueue.main) {
                             for item in json["response"]["items"] {
                                 let content: String = item.1["text"].stringValue
                                 let countLikes: String = item.1["likes"]["count"].stringValue
                                 let countComments: String = item.1["comments"]["count"].stringValue
                                 let countReposts: String = item.1["reposts"]["count"].stringValue
                                 
                                 let id: Int = item.1["source_id"].intValue
                                 let title: String
                                 let titlePhotoLink: String
                                 if (id < 0){
                                     title = sourceName[String(-id)]!
                                     titlePhotoLink = sourcePhotoLink[String(-id)]!
                                 }
                                 else {
                                     title = sourceName[String(id)]!
                                     titlePhotoLink = sourcePhotoLink[String(id)]!
                                 }
                                 var contentPhotoLink: String = ""
                                 for attach in item.1["attachments"] {
                                     if (attach.1["type"] == "photo") {
                                         contentPhotoLink = attach.1["photo"]["photo_604"].stringValue
                                         break
                                     }
                                 }
                                 news.append(News(title: title, titlePhotoLink: titlePhotoLink, content: content, contentPhotoLink: contentPhotoLink, countLikes: countLikes, countComments: countComments, countReposts: countReposts))
                                 completion(news)
                             }
                        }
                        
                    case .failure(_):
                        print ("error request")
                }
    //            print ("===")
    //            print(repsonse.value!)
    //            print ("===")
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
//                        print (item)
                        let id: String = item.1["id"].stringValue
                        let name: String = item.1["name"].stringValue
                        let url: String = item.1["photo_100"].stringValue
                        groups.append(Group(photoLink: url, name: name, id: id))
                        completion(groups)
                    }
                case .failure(_):
                    print ("error request")
            }
            
        }
       
    }
    func searchGroups(str: String, completion: @escaping ([GroupNotRealm]) -> Void){

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
                    var groups:[GroupNotRealm] = []
                    for item in json["response"]["items"] {
//                        let id: String = item.1["id"].stringValue
                        let name: String = item.1["name"].stringValue
                        let url: String = item.1["photo_100"].stringValue
                        groups.append(GroupNotRealm(photoLink: url, name: name))
                        completion(groups)
                    }
                case .failure(_):
                    print ("error request")
            }
        }
    }
}
