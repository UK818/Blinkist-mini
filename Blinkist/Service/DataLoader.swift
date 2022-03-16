//
//  DataLoader.swift
//  Blinkist
//
//  Created by mac on 31/10/2021.
//

import Foundation

public class DataLoader {
	
	var bookData = [ResultItem]()
	
	init () {
		load()
		sort()
	}
	
	func load() {
		if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
			do {
				let data = try Data(contentsOf: fileLocation)
				let jsonDecoder = JSONDecoder()
				let dataFromJson = try jsonDecoder.decode([ResultItem].self, from: data)
				self.bookData = dataFromJson
			} catch {
				fatalError("parse error")
			}
		}
	}
	
	func sort() {
		self.bookData = self.bookData.sorted(by: { $0.id < $1.id })
	}
	
}
