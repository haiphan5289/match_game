//
//  match_game_controller.swift
//  match_game
//
//  Created by HaiPhan on 6/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell_match_game"
//private let didselect_reuseIdentifier = "cell_match_game"

class match_game_controller: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var array_card: [card] = [card]()
    //khơi tạo 1 biến để lấy indexpath chọn ra
    var first_Flipped_index: IndexPath?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model_card_collect = model_card()
        array_card = model_card_collect.create_card()
        //xáo trộn lại phần từ của mảng
        array_card.shuffle()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(cell_match_game.self, forCellWithReuseIdentifier: reuseIdentifier)
        //        collectionView.register(cell_didselect.self, forCellWithReuseIdentifier: didselect_reuseIdentifier)
        //cách top - left - right - bot
        self.collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return array_card.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! cell_match_game
        cell.card_id = array_card[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! cell_match_game
        let card = array_card[indexPath.row]
            cell.transition()
            if first_Flipped_index == nil {
                first_Flipped_index = indexPath
            }
            else {
                check_match(secondindex: indexPath)
            }

        
    }
    
    func check_match(secondindex: IndexPath){
        //lấy giái trị ở inpath 1
        let cardcell = collectionView.cellForItem(at: first_Flipped_index!) as! cell_match_game
        //lấy giái trị ở indexpath 2
        let cardtwocell = collectionView.cellForItem(at: secondindex) as! cell_match_game
        
        //truyền giái trị dữ liệu
        let cardone = array_card[(first_Flipped_index?.row)!]
        let cardtwo = array_card[secondindex.row]
        //check kiểm tra giái trị 2 card
        if cardtwo.id == cardone.id {
            first_Flipped_index = nil
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                cardcell.img_show.alpha = 0
                cardtwocell.img_show.alpha = 0
            }
        }
        else {
            first_Flipped_index = nil
            cardcell.flip_black()
            cardone.isFlipped = false
            cardtwocell.transition()
            cardtwocell.flip_black()
            cardtwo.isFlipped = false
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 4 - 30, height: self.view.frame.height / 2 - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
