//
//  VKService.swift
//  vk
//
//  Created by Ksenia on 10.12.2019.
//  Copyright © 2019 Ksenia. All rights reserved.
//

import Foundation
import Alamofire

class VKService {
    // базовый URL сервиса
    let baseUrl = "https://api.vk.com/method"
//    let apiKey = Session.instance.token
    
    // метод для загрузки данных, в качестве аргументов получает город
    func getFriends(){
        
    // путь для получения погоды за 5 дней
        let path = "/friends.get"
    // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00"
        ]
        
    // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        
    // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
    func getPhotos(){
        
    // путь для получения погоды за 5 дней
        let path = "/photos.getAll"
    // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "owner_id": Session.instance.userId,
            "v": "5.00"
        ]
        
    // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        
    // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
    func listGroups(){
        
    // путь для получения погоды за 5 дней
        let path = "/groups.get"
    // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "user_id": Session.instance.userId,
            "v": "5.00"
        ]
        
    // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        
    // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
    func searchGroups(str: String){
        
    // путь для получения погоды за 5 дней
        let path = "/groups.search"
    // параметры, город, единицы измерения градусы, ключ для доступа к сервису
        let parameters: Parameters = [
            "access_token": Session.instance.token,
            "q": str,
            "v": "5.00"
        ]
        
    // составляем URL из базового адреса сервиса и конкретного пути к ресурсу
        let url = baseUrl+path
        
    // делаем запрос
        AF.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value!)
        }
    }
}
