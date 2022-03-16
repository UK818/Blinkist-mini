//
//  ResultItem.swift
//  Blinkist
//
//  Created by mac on 31/10/2021.
//

import Foundation

struct ResultItem: Codable {
	
	var id: Int
	var title: String
	var author: String
	var book_type: String
	var length: Int
	var image: String
	var description: String
	var access: String
	
}
