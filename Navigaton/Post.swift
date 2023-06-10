//
//  Post.swift
//  Novigaton
//
//  Created by OlegZernyev on 17.05.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func createPost() -> [Post] {
        var post = [Post]()
        
    post.append(Post(author: "Зевс", description: "Ульта наносит урон всем врагам", image: "zevs", likes: 21, views: 52))
    post.append(Post(author: "Мирена", description: "Ульта скрывает всех союзников", image: "mirena", likes: 23, views: 26))
    post.append(Post(author: "Джагернаут", description: "Ульта наносит урон врагам в радиусе", image: "djaga", likes: 14, views: 54))
    post.append(Post(author: "Фурион", description: "Ульта наносит урон всем врагам по очереди", image: "furion", likes: 14, views: 18))
    return post
    }

}
