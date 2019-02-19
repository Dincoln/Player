//
//  ViewController.swift
//  Player
//
//  Created by Dincoln on 2019/2/18.
//  Copyright © 2019年 Dincoln. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    let playerView = PlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(playerView)
        playerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        print(replaceUnicode(unicodeStr: "11111"))
    }
    
    
    func replaceUnicode(unicodeStr: String) -> String{
        let str = unicodeStr.replacingOccurrences(of: "\\u", with: "\\U")
        let str1 = str.replacingOccurrences(of: "\"", with: "\\\"")
        let str2 = "\"" + str1 + "\""
        let data = str2.data(using: .utf8)
        if let str3 = (try? PropertyListSerialization.propertyList(from: data!, options: PropertyListSerialization.ReadOptions.mutableContainers, format: nil) as? String){
            return str3 ?? ""
        }
        return ""
    }
    

}

