//
//  Model.swift
//  SwiftUINetworking
//
//  Created by  Mr.Ki on 19.07.2022.
//

import Foundation

struct Post: Codable, Identifiable {
   // var id = UUID()
    var id: Int
    var title: String
    var body: String
}
