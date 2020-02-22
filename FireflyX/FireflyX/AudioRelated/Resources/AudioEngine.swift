//
//  AudioEngine.swift
//  FireflyX
//
//  Created by admin on 2/14/20.
//  Copyright © 2020 Mart. All rights reserved.
//

import Foundation
import AudioKit

class AudioEngine {
    
    var mixer: AKMixer!
    var file: AKAudioFile!
    var sampler: AKAppleSampler!
    
    init() {
        do {
            file = try AKAudioFile(readFileName: "Grand Piano.wav")
            
            sampler = AKAppleSampler()
            try sampler.loadAudioFile(file)
        } catch {
            AKLog("File Not Found")
            return
        }
        
        mixer = AKMixer(sampler)
        AudioKit.output = mixer
        
        do {
            try AudioKit.start()
        } catch {
            AKLog("AudioKit did not start!")
        }
    }
    
}
