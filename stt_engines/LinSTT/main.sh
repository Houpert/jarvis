#!/bin/bash

IP_SERVER=54.36.103.34

_LinSTT_transcribe () {
	# envoi l'audio file a kaldi_gstreamer et recupere la transcription
	transcript=$(curl -X POST http://${IP_SERVER}:3000/api/transcript -H "Content-type: audio/wave" --data-binary "@$audiofile")
	transcribed=$(echo $transcript | grep -o "\[.*\]" | sed "s/\}\]//g" | sed "s/\[{//g" | sed "s/\"//g" | sed "s/\utterance://g")
	
	echo "##Transcription##"
	echo $transcribed

    say "$transcribed"
    echo $transcribed > $forder
    #wait
}

LinSTT_STT () { # recupere l'audio file et faite appel a la fonction _LinSTT_transcribe
    LISTEN $audiofile || return $?
    _LinSTT_transcribe &
    jv_spinner $!
}
 
