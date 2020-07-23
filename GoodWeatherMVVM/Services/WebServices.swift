//
//  WebServices.swift
//  GoodWeatherMVVM
//
//  Created by mohamed  habib on 23/07/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import Foundation

//MARK:-  Ressources
// ressources = sth that we're requesting
// T = type that we're requesting
struct Ressources<T> {
    
    let url: URL
    let parse: (Data) -> T?
    
}

final class WebServices {
    
    func load<T>(ressource: Ressources<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: ressource.url) { (data, response, error) in
            
            print(data)
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(ressource.parse(data))
                }
            }else{
                completion(nil)
            }
            
        }.resume()
    }
    
}
