//
//  NetworkManager.swift
//  SwiftUINetworking
//
//  Created by  Mr.Ki on 19.07.2022.
//

import Foundation

class NetworkManager {
    func getPost(commpletion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                let posts = try! JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    commpletion(posts)
                }
            }
        }.resume()
    }
    
}
