//
//  ViewController.swift
//  SwiftReels
//
//  Created by Vinod Nayak Banavath on 04/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var reelsCollectionView: UICollectionView!


   // @IBOutlet weak var reelsCollectionView: UICollectionView!


    var videos: [String] =   [
        "https://www.istockphoto.com/video/woman-surfing-at-susnet-gm870657686-145546669",
        "https://www.istockphoto.com/video/woman-surfing-at-susnet-gm870657686-145546669",
        "https://www.istockphoto.com/video/woman-surfing-at-susnet-gm870657686-145546669",
        "https://www.istockphoto.com/video/woman-surfing-at-susnet-gm870657686-145546669",
        "https://www.istockphoto.com/video/woman-surfing-at-susnet-gm870657686-145546669"
    ] // Video is your custom data model

    override func viewDidLoad() {
        super.viewDidLoad()
        reelsCollectionView.dataSource = self
        reelsCollectionView.delegate = self
        reelsCollectionView.register(UINib(nibName: "ReelsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReelsCollectionViewCell")
        // Set layout for vertical scrolling
        if let layout = reelsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            //Provide Width and Height According to your need
            let cellWidth = UIScreen.main.bounds.width / 10
            let cellHeight = UIScreen.main.bounds.height / 10
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)

            //You can also provide estimated Height and Width
            layout.estimatedItemSize = CGSize(width: cellWidth, height: cellHeight)

            //For Setting the Spacing between cells
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReelsCollectionViewCell", for: indexPath) as! ReelsCollectionViewCell
        let video = videos[indexPath.item]
        cell.configure(with: URL(string: video)!)
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    // Handle user interaction, like tapping on a video cell
}
