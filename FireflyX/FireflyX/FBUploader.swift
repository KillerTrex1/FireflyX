//
//  FBUploader.swift
//  FireflyX
//
//  Created by admin on 8/13/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import FirebaseDatabase
class FBUploader{
    var Fref:DatabaseReference!
    init(){
       Fref = Database.database().reference()
    }
    func uploadJar(jar: Jar){
        let dateNow = stringFromDate(date: localDate())
        Fref?.child(dateNow).child("Name").setValue(jar.getName())
        Fref?.child(dateNow).child("Tempo").setValue(jar.getTempo())
        for i in 0..<jar.getSongs().count{
            let song = jar.getSongs()[i]
            Fref?.child(dateNow).child("Fireflies").child("Firefly\(i+1)").child("Beat Pattern").setValue(song.getFirefly().getTail().beatPattern)
            Fref?.child(dateNow).child("Fireflies").child("Firefly\(i+1)").child("Pitch Pattern").setValue(song.getPitchPattern())
            Fref?.child(dateNow).child("Fireflies").child("Firefly\(i+1)").child("Repetitions").setValue(song.getRepetitions())
        }
        
        //Fref?.child(jar.getName()).childByAutoId().setValue(Songs)
    }
    
    
    
    
    func stringFromDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy HH:mm" //yyyy
        return formatter.string(from: date)
    }
    func localDate() -> Date {
        let nowUTC = Date()
        let timeZoneOffset = Double(TimeZone.current.secondsFromGMT(for: nowUTC))
        guard let localDate = Calendar.current.date(byAdding: .second, value: Int(timeZoneOffset), to: nowUTC) else {return Date()}

        return localDate
    }
}
