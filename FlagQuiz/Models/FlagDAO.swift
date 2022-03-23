//
//  FlagDAO.swift
//  FlagQuiz
//
//  Created by Cihan Çallı on 23.03.2022.
//

import Foundation


class FlagDAO {
    let db: FMDatabase?
    init() {
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("flagquiz.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func getRandom5( ) -> [FlagModel] {
        var list = [FlagModel]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM flags ORDER BY RANDOM() LIMIT 5", values: nil)
            while(rs.next()){
                let flag = FlagModel(flag_id: Int(rs.string(forColumn: "flag_id")!)!,
                                     flag_name: rs.string(forColumn: "flag_name")!,
                                     flag_image: rs.string(forColumn: "flag_image")!)
                list.append(flag)
            }
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        return list
    }
    
    func getRandom3WrongOption(flag_id: Int) -> [FlagModel] {
        var list = [FlagModel]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM flags  WHERE flag_id != ?  ORDER BY RANDOM() LIMIT 3", values: [flag_id])
            while(rs.next()){
                let flag = FlagModel(flag_id: Int(rs.string(forColumn: "flag_id")!)!,
                                     flag_name: rs.string(forColumn: "flag_name")!,
                                     flag_image: rs.string(forColumn: "flag_image")!)
                list.append(flag)
            }
        } catch  {
            print(error.localizedDescription)
        }
        db?.close()
        return list
    }
}
