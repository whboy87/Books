//
//  Book.swift
//  Books
//
//  Created by SDS-012 on 2017. 4. 28..
//  Copyright © 2017년 SDS-012. All rights reserved.
//

import Foundation
import UIKit

class Book: NSObject, NSCoding {
    
    enum Key: String {
        case title = "title"
        case author = "author"
        case coverImage = "coverImage"
        case url = "url"
    }
    
    let title: String
    let author: String?
    let coverImage: UIImage?
    let url: String?
    
    init(title: String, author: String?, coverImage: UIImage?, url: String?) {
        self.title = title
        self.author = author
        self.coverImage = coverImage
        self.url = url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: Key.title.rawValue)
        aCoder.encode(self.author, forKey: Key.author.rawValue)
        aCoder.encode(self.coverImage, forKey: Key.coverImage.rawValue)
        aCoder.encode(self.url, forKey: Key.url.rawValue)
        
        print("\(self.title) was encoded.")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: Key.title.rawValue) as! String
        self.author = aDecoder.decodeObject(forKey: Key.author.rawValue) as? String
        self.coverImage = aDecoder.decodeObject(forKey: Key.coverImage.rawValue) as? UIImage
        self.url = aDecoder.decodeObject(forKey: Key.url.rawValue) as? String
        
        print("\(self.title) was decoded.")
    }
}
