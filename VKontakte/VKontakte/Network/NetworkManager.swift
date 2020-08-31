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
 
    //список групп
    func loadGroups(token: String, completion: @escaping () -> Void) {
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
                completion()
                
               // print("!!!! \(vkGroups)")
                
            } catch {
                print(error)
            }
                        
        }
        
    }
    
    //список друзей
    func loadFriends(userId: Int, token: String, completion: @escaping () -> Void) {
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
                completion()
                //print("!!!! \(vkUsers)")
            } catch {
                print(error)
            }
                        
        }
        

    }
    
    //список фотографий
    func loadPhotos(userId: Int, token: String, completion: @escaping () -> Void) {
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
                completion()
                
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
        
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm(configuration: config)
                
//                try realm.write {
//                  realm.deleteAll()
//                }
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkUsers, update: .all)
                
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
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            do {
    // получаем доступ к хранилищу
                let realm = try Realm(configuration: config)
                
//                try realm.write {
//                  realm.deleteAll()
//                }
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkPhotos, update: .all)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }
    
    //сохранение групп в Realm
        func saveGroupsData(_ vkGroups: [VKGroup]) {
             let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    // обработка исключений при работе с хранилищем
            do {
    // получаем доступ к хранилищу
                let realm = try Realm(configuration: config)
               
//                try realm.write {
//                  realm.deleteAll()
//                }
    // начинаем изменять хранилище
                realm.beginWrite()
                
    // кладем все объекты класса погоды в хранилище
                realm.add(vkGroups, update: .all)
                
    // завершаем изменения хранилища
                try realm.commitWrite()
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
        }

}
