//
//  ContentView.swift
//  SwiftUINetworking
//
//  Created by  Mr.Ki on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List(posts) { post in
                VStack {
                    Text(post.title)
                        .fontWeight(.bold)
                    Text(post.body)
                }
            }.onAppear() {
                NetworkManager().getPost { posts in
                    self.posts = posts
                }
            }.navigationTitle("Posts")
        }
       //     .padding()
    }
}

struct Post: Codable, Identifiable {
   // var id = UUID()
    var id: Int
    var title: String
    var body: String
}

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
