import ollama

convo = []


def stream_response(prompt):
    convo.append({'role':'user', 'content':prompt})
    response = ''
    stream = ollama.chat(model="llama3", message=convo, stream = true)
    print('\nassistance')


    for chunk in stream:
        content = chunk['message']['content']
        response += content
        print(content, end='', flush=true)

    print('\n')
    convo.append({'role':'assistance', 'content': response })


while true:
    prompt = input("user")
    stream_response(prompt=prompt) 
