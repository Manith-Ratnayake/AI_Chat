import ollama
import chromadb

convo = []
client = chromadb.client()
message_history = [{'id':1,'prompt':'','response':''}]




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


def create_vector_db(conversations):
    vector_db_name = 'conversations'

    try:
        client.delete_collection(name=vector_db_name)

    except ValueError:
        print("!!! ValueError")


    vector_db = client.create_collection(name=vector_db_name)
    

    for c in conversations:
        serialized_convo = f"Prompt: {c['prompt']} response: {c['response']}"
        response = ollama.embedding(model='nomic-embeded-text', prompt=serialzed_convo)
        embedding = response['embedding']

        vector_db.add(
            ids=[str(c['id'])],
            embeddings = [embedding],
            documents = [serialzied_convo]
            
        )
    


def retrieve_embeddings(prompt):
    response = ollama.embedding(model='nomic-embed-text', prompt=prompt)
    prompt_embedding = repsonse['embedding']

    vector_db = client.get_collection(name='conversation')
    results = vector_db.query(query_embeddings=[prompt_embedding], n_results=1)
    best_embedding = results['documents'][0][0]

    return best_embedding


create_vector_db(conversation=message_history)


while true:
    prompt = input("user")
    context = retrieve_embedding(prompt=prompt)
    prompt = f'USER Prompt : {prompt} \n Context FROM EMBEDDING : {context}'
    stream_response(prompt=prompt) 
