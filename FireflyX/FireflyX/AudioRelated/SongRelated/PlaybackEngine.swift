//
//  PlaybackEngine.swift
//  FireflyX
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
class PlaybackEngine{
    static func makeAndPlaySong(mFirefly:Firefly){
        let newSong = songConverter(nfirefly: mFirefly)
        print("song tempo: \(newSong.getTempo())")
        print("song rep:\(newSong.repetitions)")
        print("song beats:\(mFirefly.getTail().getBeatPattern())")
        SongPlayer.placeSong(song: newSong)
        SongPlayer.playSong()
    }
    static func makeSongnoPitch(mFirefly:Firefly)->Song{
        let newSong = songConverter(nfirefly: mFirefly)
        return newSong
    }
    static func songConverter(nfirefly:Firefly)->Song{
        return Song(
            notes: noPitchSongNoteConverter(beatPattern:nfirefly.getTail().getBeatPattern()),
            tempo: nfirefly.getBody().getTempo(),
            repetitions: nfirefly.getWing().getRepetitions())
    }
    
    static func noPitchSongNoteConverter(beatPattern:String)->[Note]{
        let Tpitch = Pitch.None
        let beatLetters = beatPattern.components(separatedBy: " ")
        var beats:[Note]=[]
        for i in 0..<beatLetters.count{
            switch beatLetters[i]{
            case "W":
                beats.append(Note(type:.whole,pitch:Tpitch))
            case "Wr":
                beats.append(Note(type:.wholeRest,pitch:Tpitch))
            case "H":
                beats.append(Note(type:.half,pitch:Tpitch))
            case "Hr":
                beats.append(Note(type:.halfRest,pitch:Tpitch))
            case "Q":
                beats.append(Note(type:.quarter,pitch:Tpitch))
            case "Qr":
                beats.append(Note(type:.quarterRest,pitch:Tpitch))
            case "E":
                beats.append(Note(type:.eighth,pitch:Tpitch))
            case "Er":
                beats.append(Note(type:.eighthRest,pitch:Tpitch))
            default:
                beats.append(Note(type:.eighth,pitch:Tpitch))
            }
        }
        return beats
    }
    
    
        
        
}
