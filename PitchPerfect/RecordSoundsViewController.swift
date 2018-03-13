 //
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Luís Antônio de Oliveira Santos on 21/02/2018.
//  Copyright © 2018 Luís Antônio de Oliveira Santos. All rights reserved.
//

import UIKit
import AVFoundation

 class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
<<<<<<< HEAD
||||||| merged common ancestors
    
    
    /* MARK: DICAS
     
        1)  incluir esta classe "AVAudioRecorderDelegate" para delegar a ação de mudar de tela sem usar a segue via UI e sim via código. Sendo assim, o ViewController vai ser o Delegate do AVAudioRecorder.
     
        2) na função recordAudio tem que configurar este ViewController com o AVAudioRecorderDelegate adicionando esta linha -> audioRecorder.delegate = self
     
        3) incluir a função audioRecorderDidFinishRecording -> esta função vai chamar a transição
     
        4) para direcionar a segue de um VC para outro sem usar UI, tem que ir no resumo e arrastar de um VC para outro. Em seguida basta adicionar o caminho colocando o identificador da segue.
              Ex: performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
     
     */

    
=======
    
    
    /* MARK: DICAS
     
        1)  incluir esta classe "AVAudioRecorderDelegate" para delegar a ação de mudar de tela sem usar a segue via UI e sim via código. Sendo assim, o ViewController vai ser o Delegate do AVAudioRecorder.
     
        2) na função recordAudio tem que configurar este ViewController com o AVAudioRecorderDelegate adicionando esta linha -> audioRecorder.delegate = self
     
        3) incluir a função audioRecorderDidFinishRecording -> esta função vai chamar a transição
     
        4) para direcionar a segue de um VC para outro sem usar UI, tem que ir no resumo e arrastar de um VC para outro. Em seguida basta adicionar o caminho colocando o identificador da segue.
              Ex: performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        5) GitHub
     */

    
>>>>>>> 43a3596a69977b3c31075ce1eb22c9feec6238bd
    var audioRecorder: AVAudioRecorder!

    // MARK: Outlets
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false
    }
<<<<<<< HEAD
    
||||||| merged common ancestors

   
    
=======

>>>>>>> 43a3596a69977b3c31075ce1eb22c9feec6238bd
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: Functions
    
    // MARK: Botão para gravar  o som
    @IBAction func recordAudio(_ sender: Any) {

        configuracaoUI(gravando: true)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
  
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    // MARK:  Botão para parar a gravação
    @IBAction func stopRecording(_ sender: Any) {

        configuracaoUI(gravando: false)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        // passo a segue e o caminho aonde o arquivo que gravou o som está.
        
        if flag == true{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else{
            print("recording was not successful")
        }
       
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
 
    func configuracaoUI (gravando: Bool){
        recordingLabel.text = gravando ? "Recording in Progress" : "Tap to record"
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true
        
    }
}

