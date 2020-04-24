//
//  SongPlayer.swift
//  FireflyX
//
//  Created by admin on 2/15/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import AudioKit
class SongPlayer{
    static var timer: Timer!

    static var currBeatCounter = 0
    static var currNote: Note!
    static var currNoteIndex = -1
    static let audioEngine = AudioEngine()
    static var repeatCounter=0
    
    static var curSong: Song!
    
    static func placeSong(song:Song){
        curSong = song
        repeatCounter = 0
        
    }
    static func playSong(){
        print("DURATION OF quarter NOTE: \(60 / self.curSong.getTempo() * 1.0)")
        self.timer = Timer.scheduledTimer(withTimeInterval: 60 / self.curSong.getTempo() * 0.5, // 1/128 = 0.0078125
        repeats: true,
        block: {_ in self.optimizedPlaybackLoop(
            notes: self.curSong.getNotes(),
                sampler: self.audioEngine.sampler
            )})
    }
    //static var num = 0
    static func optimizedPlaybackLoop (notes: [Note], sampler: AKAppleSampler) {
        //print(self.currBeat)
        
        // play next note if counter is 0
        if self.currBeatCounter == 0 {
            self.currNoteIndex += 1 // move to next note
            
            // if index is out of bounds of the note array
            // invalidate the timer to stop it
            if self.currNoteIndex > notes.count-1 {
                self.timer.invalidate()
                repeatCounter += 1
                currBeatCounter = 0
                currNoteIndex = -1
                if repeatCounter != curSong.getRepetitions(){
                    playSong()
                }else{
                    View.hidePanels(val: false)
                }
                
                return
            }
            
            // assign next note to current note
            self.currNote = notes[self.currNoteIndex]
            print("Current MIDI Note Played: \(currNote.convertBeat())")
            
            // get the MIDI number of current note and play it using the sampler
            // from AudioEngine
            if currNote.convertToMIDI() != 0{
                try! sampler.play(noteNumber: MIDINoteNumber(currNote.convertToMIDI()))
                FireflyAnimator.animateImageOnce(duration: (60.0 / self.curSong.getTempo() *  0.5) * self.currNote.getValue())
                //print("DURATION OF NOTE: \((60.0 / self.curSong.getTempo() * (self.currNote.getValue() )))")
            }
            
            
            // you can play simultaneously by activating this line
            //try! sampler.play(noteNumber: MIDINoteNumber(currNote.convertToMIDI() - 4))
            
            // if you plan to implement a chord, a loop through an array of notes
            // can do the trick
            // for note in chord {
            //   sampler.play(noteNumber: MIDINoteNumber(currNote.convertToMIDI()))
            // }
            // for every note inside a chord play it
        }
        
        self.currBeatCounter += 1
        
        // if currBeatCounter reaches the Note's {value}
        // then reset back counter to 0 to play next note
        if (currBeatCounter == currNote.value) {
            self.currBeatCounter = 0
            //self.timer.invalidate()
        }
        
    }
}


