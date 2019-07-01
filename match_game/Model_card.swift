//
//  Model_card.swift
//  match_game
//
//  Created by HaiPhan on 6/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit

class model_card {
    
    func create_card() -> [card]{
        var array_card_temp: [card] = [card]()
        var array_id: [UInt32] = [UInt32]()
        var array_card_backup: [card] = [card]()
        
        //        let card1: card = card(id: "1")
        //        let card2: card = card(id: "2")
        //        array_card_temp.append(card1)
        //        array_card_temp.append(card2)
        //            repeat {
        //                let random = arc4random_uniform(4) + 1
        //                let card_h: card = card(id: "\(random)")
        //                array_card_backup.append(card_h)
        //                if array_id.contains(random) {
        //                }
        //                else {
        //                    array_id.append(random)
        //                    let card1: card = card(id: "\(random)")
        //                    let card2: card = card(id: "\(random)")
        //                    array_card_temp.append(card1)
        //                    array_card_temp.append(card2)
        //                    dump(array_card_temp)
        //                }
        //
        //
        //            }while array_card_temp.count < 8
        //dùng vào lặp while do để tạo 1 mảng gồm các phần từ không bị duplicate
        //kiểm tra count < 8 thi chạy vòng loop
        while array_card_temp.count < 20 {
            //tạo 1 biến random từ 1 >> 4
            let random = arc4random_uniform(20) + 1
            //truyền giái trị vào beiens card
//            let card_h: card = card(id: "\(random)", isFlipped: false, isMatch: false)
//            array_card_backup.append(card_h)
            //kiểm tra random có trong mảng không
            if array_id.contains(random) {
            }
            else {
                array_id.append(random)
                let card1: card = card(id: "\(random)", isFlipped: false, isMatch: false)
                let card2: card = card(id: "\(random)", isFlipped: false, isMatch: false)
                array_card_temp.append(card1)
                array_card_temp.append(card2)
            }
        }
        return array_card_temp
    }
}

class card {
    var id : String!
    var isFlipped: Bool!
    var isMatch: Bool!
    init(id: String, isFlipped: Bool, isMatch: Bool) {
        self.id = id
        self.isFlipped = isFlipped
        self.isMatch = isMatch
    }
}
