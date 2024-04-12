//
//  ReelsCollectionViewCell.swift
//  SwiftReels
//
//  Created by Vinod Nayak Banavath on 04/04/24.
//

import UIKit
import AVFoundation

class ReelsCollectionViewCell: UICollectionViewCell {

    //@IBOutlet weak var containerView: UIView!

    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?

    func configure(with url: URL) {
        player = AVPlayer(url: url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = contentView.bounds
        contentView.layer.addSublayer(playerLayer!)
        // Start playback
        player?.play()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        player?.pause()
        playerLayer?.removeFromSuperlayer()
    }

}
