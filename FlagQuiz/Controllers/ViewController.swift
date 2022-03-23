//
//  ViewController.swift
//  FlagQuiz
//
//  Created by Cihan Çallı on 22.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        CopyDatabase()
    }
    
    func CopyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "flagquiz", ofType: ".sqlite")
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let placeToCopy = URL(fileURLWithPath: destinationPath).appendingPathComponent("flagquiz.sqlite")
        
        if fileManager.fileExists(atPath: placeToCopy.path){
            print("THE DATABASE ALREADY EXISTS. NO NEED TO COPY AGAIN")
        }else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch {
                print(error)
            }
        }
    }
}

