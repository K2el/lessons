//
//  NetworkManager.swift
//  VKontakte
//
//  Created by Анна Ковтун on 12.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    static let session: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
//    func simpleWeatherRequest() {
//         //München
//        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Tomsk&appid=72d0c294c9e0f3370139ce5d00a6b575&units=metric") else { return }
//        
//        let session = URLSession.shared
//        
//        print(Thread.current)
//        
//        let dataTask = session.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) {
//                    print(json)
//                }
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//            print(Thread.current)
//        }
//        dataTask.resume()
//    }
    
//    func advancedWeatherRequest() {
//        // Custom session
//        let configuration = URLSessionConfiguration.default
//        let session =  URLSession(configuration: configuration)
//
//        var urlConstructor = URLComponents()
//        urlConstructor.scheme = "http"
//        urlConstructor.host = "api.openweathermap.org"
//        urlConstructor.path = "/data/2.5/weather"
//        urlConstructor.queryItems = [
//            URLQueryItem(name: "q", value: "Tomsk"),
//            URLQueryItem(name: "appid", value: "72d0c294c9e0f3370139ce5d00a6b575"),
//            URLQueryItem(name: "units", value: "metric"),
//        ]
//
//        guard let url = urlConstructor.url else { return }
//
//        let dataTask = session.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                if let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) {
//                    print(json)
//                }
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//        dataTask.resume()
//    }
    
//    func postTemplateRequest() {
//        let configuration = URLSessionConfiguration.default
//        let session =  URLSession(configuration: configuration)
//
//        var urlConstructor = URLComponents()
//        urlConstructor.scheme = "http"
//        urlConstructor.host = "jsonplaceholder.typicode.com"
//        urlConstructor.path = "/posts"
//        urlConstructor.queryItems = [
//            URLQueryItem(name: "title", value: "foo"),
//            URLQueryItem(name: "body", value: "bar"),
//            URLQueryItem(name: "userId", value: "1")
//        ]
//
//        guard let url = urlConstructor.url else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.allowsCellularAccess = false
//
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//            if let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) {
//                print(json)
//            }
//        }
//        dataTask.resume()
//    }
    
//    func alamofireRequest() {
//        AF.request("http://api.openweathermap.org/data/2.5/weather?q=Tomsk&appid=72d0c294c9e0f3370139ce5d00a6b575&units=metric").responseJSON { response in
//            if let data = response.value {
//                print(data)
//            }
//        }
//    }
    
//    func alamofireAdvancedRequest() {
//        let url = "http://api.openweathermap.org"
//        let path = "/data/2.5/weather"
//        let params = [
//            "q": "Tomsk",
//            "appid": "72d0c294c9e0f3370139ce5d00a6b575",
//            "units": "metric",
//        ]
//
//        AF.request(url + path, method: .get, parameters: params).responseJSON { response in
//            if let data = response.value {
//                print(data)
//            }
//        }
//
//        NetworkService.session.request(url + path, method: .get, parameters: params).response { response in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) {
//                    print(json)
//                }
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    //список групп
    func loadGroups(token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.92",
            "count": "1"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    //список друзей
    func loadFriends(userId: Int, token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "user_id": userId,
            "order": "random",
            "v": "5.122",
            "fields": "nickname",
            "count": "1"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    //список фотографий
    func loadPhotos(userId: Int, token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "album_id": "wall",
            "owner_id": userId,
            "extended": "1",
            "v": "5.122",
            "count": "1"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            
            print(json)
        }
    }
    
    //поиск групп
    func searchGroups(userId: Int, token: String, searchText: String) {
          let baseUrl = "https://api.vk.com"
          let path = "/method/groups.search"
          
          let params: Parameters = [
              "access_token": token,
              "q": searchText,
              "type": "group",
              "v": "5.122",
              "count": "1"
          ]
          
          NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
              guard let json = response.value else { return }
              
              print(json)
          }
      }
}
