#!/bin/bash

_LinSTT_transcribe () {
    
    # envoi l'audio file a kaldi_gstreamer et recupere la transcription
    curl -T $audiofile  http://localhost:8888/client/dynamic/recognize > ~/jarvis/stt_engines/LinSTT/res/event.json
    python linstt.py
    read line < ~/jarvis/stt_engines/LinSTT/res/transcription.txt
    say "$line"
    wait
}

LinSTT_STT () { # recupere l'audio file et faite appel a la fonction _LinSTT_transcribe
    LISTEN $audiofile || return $?
    _LinSTT_transcribe &
    jv_spinner $!
}
 
