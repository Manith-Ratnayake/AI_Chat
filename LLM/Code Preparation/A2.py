import ollama

convo = []

while True:
    prompt = input("User")
    convo.append({'role':'user', 'content':'prompt'})

    output = ollama.chat(model="llama3", message=convo)
    response = output['message']['content']

    print(f"ASSISTANCE : \n {response} \n")
    convo.append({'role': 'assistance', 'content':response})



    
