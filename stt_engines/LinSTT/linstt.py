import json
import stt_config

def linstt:
    # lit le json recus de kaldi
    json_data=open(STTJSON_PATH)

    #parse et recupere la transcription
    data = json.load(json_data)
    reply=""

    reply = str(data["result"]["hypotheses"][0]["transcript"])    

    file = open(TRANSCRIPTION_PATH, 'w')
    file.write(reply.encode('utf-8'))
    file.close()

    json_data.close()
    
linstt()