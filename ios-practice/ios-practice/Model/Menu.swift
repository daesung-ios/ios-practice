//
//  Menu.swift
//  ios-practice
//
//  Created by temp on 2021/11/02.
//

import Foundation
import SwiftUI

struct Menu: Hashable, Codable, Identifiable {
    var id: String { title }
   
    var imageName: String
    var title: String
    
    var image: Image {
        Image(imageName)
    }
}
