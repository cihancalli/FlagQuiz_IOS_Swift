//
//  FlagModel.swift
//  FlagQuiz
//
//  Created by Cihan Çallı on 23.03.2022.
//

import Foundation

class FlagModel: Equatable, Hashable {
    var flag_id: Int?
    var flag_name:String?
    var flag_image:String?
    
    init() {
         
    }
    
    init(flag_id: Int, flag_name:String, flag_image:String) {
        self.flag_id = flag_id
        self.flag_name = flag_name
        self.flag_image = flag_image
    }
    
    var hashValue: Int {
        get {
            return flag_id.hashValue
        }
    }
    
    static func == (lhs:FlagModel, rhs:FlagModel) -> Bool {
        return lhs.flag_id == rhs.flag_id
    }
}
