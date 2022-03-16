//
//  CollectionViewController.swift
//  Blinkist
//
//  Created by mac on 31/10/2021.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	
	let data = DataLoader().bookData
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
    }

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
    }

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCell", for: indexPath) as? BookCell else {
			fatalError("Cant find BookCell")
		}
    
		cell.bookImage.image = UIImage(named: data[indexPath.row].image)
		cell.bookTitle.text = data[indexPath.row].title
		cell.bookAuthor.text = data[indexPath.row].author
		cell.bookDesc.text = data[indexPath.row].description
		cell.bookInfo.text = "\(data[indexPath.row].book_type) . \(data[indexPath.row].length/60)h"
		
		if data[indexPath.row].access == "locked" {
			cell.bookAccess.image = UIImage(systemName: "lock.circle.fill")
		}
    
        return cell
    }
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		collectionView.deselectItem(at: indexPath, animated: true)
		guard let DetailedView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedBookView") as? DetailedBookView else {
			fatalError()
		}
		
		DetailedView.details = data[indexPath.row]
		self.navigationController?.pushViewController(DetailedView, animated: true)
	
	}
	

}
