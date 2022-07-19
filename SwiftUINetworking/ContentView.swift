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
           
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
