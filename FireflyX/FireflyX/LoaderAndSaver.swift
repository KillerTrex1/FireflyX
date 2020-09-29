//
//  LoaderAndSaver.swift
//  FireflyX
//
//  Created by admin on 8/12/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class LoaderAndSaver{
    static var uDef = UserDefaults.standard
    static func loadTask(key: String)->[Jar]{
        if let temp = uDef.data(forKey: key){
            let data = try? JSONDecoder().decode([Jar].self, from: temp)
            let tempJars = data ?? [Jar]()
            return tempJars
        }else{
            return [Jar]()
        }
    }
    static func saveTask(Songs: [Jar],key: String){
        if let encoded = try? JSONEncoder().encode(Songs){
            print(encoded)
            uDef.set(encoded,forKey: key)
        }
    }
}
