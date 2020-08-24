//
//  NetworkManager.swift
//  VKontakte
//
//  Created by Анна Ковтун on 12.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

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
    func loadGroups(token: String, completion: @escaping ([VKGroup]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "v": "5.122",
            "extended": "1",
            "count": "20"
        ]
        
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let data = response.data else { return }
            
            //Парсинг с использованием Codable
            do {
                let vkGroups = try JSONDecoder().decode(GroupCodable.self, from: data).response.items
                
                self.saveGroupsData(vkGroups)
                completion(vkGroups)
                
                print("!!!! \(vkGroups)")
                
            } catch {
                print(error)
            }
                        
        }
        
    }
    
    //список друзей
    func loadFriends(userId: Int, token: String, completion: @escaping ([VKuser]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "fields": "photo_100",
            "v": "5.122",
            "count": "50"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let data = response.data else { return }
            //print(data)
            //Парсинг с использованием Codable
            do {
                let vkUsers = try JSONDecoder().decode(UserCodable.self, from: data).response.items
                self.saveVKuserData(vkUsers)
                completion(vkUsers)
                //print("!!!! \(vkUsers)")
            } catch {
                print(error)
            }
                        
        }
        

    }
    
    //список фотографий
    func loadPhotos(userId: Int, token: String, completion: @escaping ([VKPhotos]) -> Void) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.get"
        
        let params: Parameters = [
            "access_token": token,
            "album_id": "wall",
            "owner_id": userId,
            "v": "5.122",
            "count": "10"
        ]
        
        NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let data = response.data else { return }
            
            //Парсинг с использованием Codable
            do {
                let vkPhotos = try JSONDecoder().decode(PhotosCodable.self, from: data).response.items
                
                self.saveVKPhotosData(vkPhotos)
                completion(vkPhotos)
                
                //print("!!!! \(vkPhotos)")
            } catch {
                print(error)
            }
                        
        }
    }
    
    //поиск групп
    func searchGroups(userId: Int, token: String, searchText: String, completion: @escaping ([VKGroupSearch]) -> Void) {
          let baseUrl = "https://api.vk.com"
          let path = "/method/groups.search"
          
          let params: Parameters = [
              "access_token": token,
              "q": searchText,
              "type": "group",
              "v": "5.122",
              "count": "20"
          ]
          
          NetworkService.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
              guard let data = response.data else { return }
              
              //Парсинг с использованием Codable
              do {
                  let vkGroupSearch = try JSONDecoder().decode(GroupSearchCodable.self, from: data).response.items
                  
                  completion(vkGroupSearch)
                  
                  //print("!!!! \(vkPhotos)")
              } catch {
                  print(error)
              }
                          
          }
      }
    
    //сохранение пользователей в Realm
        func saveVKuserData(_ vkUsers: [VKuser]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkUsers)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

    //сохранение фото в Realm
        func saveVKPhotosData(_ vkPhotos: [VKPhotos]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkPhotos)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }
    
    //сохранение групп в Realm
        func saveGroupsData(_ vkGroups: [VKGroup]) {
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm()
                
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkGroups)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}
