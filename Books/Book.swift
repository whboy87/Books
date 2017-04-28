//
//  Book.swift
//  Books
//
//  Created by SDS-012 on 2017. 4. 28..
//  Copyright © 2017년 SDS-012. All rights reserved.
//

import Foundation
import UIKit

class Book {
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
}
