//
//  Jar.swift
//  FireflyX
//
//  Created by admin on 8/3/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class Jar: Codable{
    var Songs: [Song]
    var Name: String!
    //var Notes: [Note]
    var songChangeIndexes: [Int]
    init(){
        Songs = [Song]()
        //Notes = [Note]()
        songChangeIndexes = [Int]()
    }
    func MakeFullSong()->[Note]{
        var Notes = [Note]()
        var tempSongChangeIndexes = [Int]()
        var noteIndex = 0
        for song in Songs{
            
            Notes+=song.getRepeatedNotes()
            //print("repetitions: \(song.getRepetitions()) total: \(song.getRepeatedNotes().count)")
            noteIndex = noteIndex + (song.getRepetitions()*song.getNotes().count)
            tempSongChangeIndexes.append(noteIndex)
        }
        songChangeIndexes = tempSongChangeIndexes
        print(songChangeIndexes)
        return Notes
    }
    func setName(s: String){
        Name = s
    }
    func getName()->String{
        return Name
    }
    func addSong(song: Song){
        Songs.append(song)
    }
    func replace(index: Int,song: Song){
        Songs[index] = song
    }
    func getSongAtIndex(index: Int)-> Song{
        return Songs[index]
    }
    func changeSongsTempo(color: Colors){
        for song in Songs{
            song.changeFireflyTempo(color: color)
        }
    }
    func getTempo()-> Double{
        if Songs.count > 0{
            return Songs[0].getTempo()
            
        }
        return 25.0
    }
    func getChangeIndexes()-> [Int]{
        return songChangeIndexes
    }
    func getSongs()-> [Song]{
        return Songs
    }
}
