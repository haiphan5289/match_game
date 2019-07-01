//
//  cell_match_game.swift
//  match_game
//
//  Created by HaiPhan on 6/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class cell_match_game: UICollectionViewCell {
    var img: UIImageView!
    var img_show: UIImageView!
    var card_id: card? {
        didSet {
            guard let id = card_id?.id else {
                return
            }
            img_show.image = UIImage(named: "\(id)")
            img_show.isHidden = true
            img.image = UIImage(named: "black")
            img.isHidden = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup_view()
    }
    
    func setup_view(){
        image_show_autolayout()
        image_black_ground_setup_autolayout()
        
    }
    
    //setup
    func transition(){
        UIView.animate(withDuration: 1, animations: {
        UIView.transition(from: self.img, to: self.img_show, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)          
        }, completion: nil)

    }
    
    func flip_black(){
        //chỉnh thời gian hiện tại + 1s rồi mới chạy hàm dưới
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
             UIView.transition(from: self.img_show, to: self.img, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }

    }
    
    //setup - image show
    func image_show_autolayout(){
        img_show = UIImageView()
        img_show.image = UIImage(named: "1")
        //        img_show.backgroundColor = UIColor.red
        img_show.contentMode = .scaleToFill
        //        img.backgroundColor = UIColor.blue
        self.addSubview(img_show)
        
        img_show.translatesAutoresizingMaskIntoConstraints = false
        img_show.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        img_show.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        img_show.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        img_show.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func image_black_ground_setup_autolayout(){
        img = UIImageView()
        img.image = UIImage(named: "black")
        img.contentMode = .scaleToFill
        //        img.backgroundColor = UIColor.blue
        self.addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        img.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        img.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        img.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
