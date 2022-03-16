//
//  DetailedBookView.swift
//  Blinkist
//
//  Created by mac on 02/11/2021.
//

import UIKit

class DetailedBookView: UIViewController {
	
	public var details: ResultItem?
	
	@IBOutlet weak var selectedBookImage: UIImageView!
	@IBOutlet weak var selectedBookTitle: UILabel!
	@IBOutlet weak var selectedBookAuthor: UILabel!
	@IBOutlet weak var selectedBookDuration: UILabel!
	@IBOutlet weak var selectedBookDesc: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		if let response = details {
			selectedBookImage.image = UIImage(named: response.image)
			selectedBookTitle.text = response.title
			selectedBookAuthor.text = response.author
			selectedBookDuration.text = "\(response.length/60)hr \(response.length%60)min"
			selectedBookDesc.text = response.description
		}
    }
	
}
