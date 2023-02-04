//
//  Seeds.swift
//  AuthorsTests
//
//  Created by Marcel Camargos on 04/02/23.
//

@testable import Authors
import UIKit

struct Seeds {
    struct Posts {
        static let post1 = Post(userId: 1, id: 1, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
          
        static let post2 = Post(userId: 1, id: 2, title: "qui est esse", body: "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla")
          
        static let post3 = Post(userId: 1, id: 3, title: "ea molestias quasi exercitationem repellat qui ipsa sit aut", body: "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut")
          
        static let post4 = Post(userId: 1, id: 4, title: "eum et est occaecati", body: "ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit")
          
        static let post5 = Post(userId: 1, id: 5, title: "nesciunt quas odio", body: "repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque")
          
        static let post6 = Post(userId: 1, id: 6, title: "dolorem eum magni eos aperiam quia", body: "ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae")
          
        static let all = [post1, post2, post3, post4, post5, post6]
    }
    
    struct Users {
        static let user1 = User(
            id: 1,
            name: "Leanne Graham",
            username: "Bret",
            email: "Sincere@april.biz",
            address: Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: Geo(lat: "-37.3159", lng: "81.1496")),
            phone: "1-770-736-8031 x56442",
            website: "hildegard.org",
            company: Company (name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
          )
        
        static let user2 = User(
            id: 2,
            name: "Ervin Howell",
            username: "Antonette",
            email: "Shanna@melissa.tv",
            address: Address(street: "Victor Plains", suite: "Suite 879", city: "Wisokyburgh", zipcode: "90566-7771", geo: Geo(lat: "-43.9509", lng: "-34.4618")),
            phone: "010-692-6593 x09125",
            website: "anastasia.net",
            company: Company(name: "Deckow-Crist", catchPhrase: "Proactive didactic contingency", bs: "synergize scalable supply-chains")
          )
        
        static let user3 = User(
            id: 3,
            name: "Clementine Bauch",
            username: "Samantha",
            email: "Nathan@yesenia.net",
            address: Address(street: "Douglas Extension", suite: "Suite 847", city: "McKenziehaven", zipcode: "59590-4157", geo: Geo(lat: "-68.6102", lng: "-47.0653")),
            phone: "1-463-123-4447",
            website: "ramiro.info",
            company: Company(name: "Romaguera-Jacobson", catchPhrase: "Face to face bifurcated interface", bs: "e-enable strategic applications")
          )
        
        static let all = [user1, user2, user3]
    }
    
    struct Comments {
        static let comment1 = Comment(
          postId: 1,
          id: 1,
          name: "id labore ex et quam laborum",
          email: "Eliseo@gardner.biz",
          body: "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
        
        static let comment2 = Comment(
          postId: 1,
          id: 2,
          name: "quo vero reiciendis velit similique earum",
          email: "Jayne_Kuhic@sydney.com",
          body: "est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et")
        
        static let comment3 = Comment(
          postId: 1,
          id: 3,
          name: "odio adipisci rerum aut animi",
          email: "Nikita@garfield.biz",
          body: "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione")
        
        static let comment4 = Comment(
          postId: 1,
          id: 4,
          name: "alias odio sit",
          email: "Lew@alysha.tv",
          body: "non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati")
        
        static let comment5 = Comment(
          postId: 1,
          id: 5,
          name: "vero eaque aliquid doloribus et culpa",
          email: "Hayden@althea.biz",
          body: "harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et")
        
        static let comment6 = Comment(
          postId: 2,
          id: 6,
          name: "et fugit eligendi deleniti quidem qui sint nihil autem",
          email: "Presley.Mueller@myrl.com",
          body: "doloribus at sed quis culpa deserunt consectetur qui praesentium\naccusamus fugiat dicta\nvoluptatem rerum ut voluptate autem\nvoluptatem repellendus aspernatur dolorem in")
        
        static let comment7 = Comment(
          postId: 2,
          id: 7,
          name: "repellat consequatur praesentium vel minus molestias voluptatum",
          email: "Dallas@ole.me",
          body: "maiores sed dolores similique labore et inventore et\nquasi temporibus esse sunt id et\neos voluptatem aliquam\naliquid ratione corporis molestiae mollitia quia et magnam dolor")
        
        static let all = [comment1, comment2, comment3, comment4, comment5, comment6, comment7]
    }
}
