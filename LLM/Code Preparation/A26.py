import ollama
import chromadb

import pycopg
import pycopg.rows as dict_rows
import ast

from tqdm import tqdm

convo = [{'role':'systems', 'content'}]
client = chromadb.client()
message_history = [{'id':1,'prompt':'','response':''}]

DB_PARAMS = {
    'dbname':'memory_agent',
    'user':'',
    'password':''
    'host':''
    'port':''
}


system_prompt = {
    'You are an AI Assistance'
}
 

def connect_db():
    conn = pycopg.connect(**DB_PARAMS)
    return conn


def fetch_conversation():
    conn = connect_db()
    with conn.cursor(row_factory=dict_rows) as cursor:
        cursor.execute('SELECT * FROM conversation')
        conversation = cursor.fetchall()
    conn.close()
        


def stream_response(prompt):
    response = ''
    stream = ollama.chat(model="llama3", message=convo, stream = true)
    print('\nassistance')


    for chunk in stream:
        content = chunk['message']['content']
        response += content
        print(content, end='', flush=true)

    print('\n')
    store_conversation(prompt=prompt)
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
    


def store_conversation(prompt, response):
    conn = connect_db()
    with conn.cursor() as cursor:
        cursor.execute('INSERT INTO conversation {timestamp, prompt, response} VALUES {CURRENT_TIMESTAMP, %s, %s)',
                       (prompt,response)
        conn.commit()
    conn.close()


def retrieve_embeddings(quries, results_per_query):

    embedding = set()

    for query in tqdm(queries, desc='Processing querires to vector database'):
        response = ollama.embedding(model='nomic-embed-text', prompt=query)
        query_embeddings = response['embeddings']

        vector_db = client.get_collection(name='conversations')
        results = vector_db.query(query_embeddings=[query_embeddings], n_results = results_per_query)
        best_embedding = results['documents'][0]



    response = ollama.embedding(model='nomic-embed-text', prompt=prompt)
    prompt_embedding = repsonse['embedding']

    vector_db = client.get_collection(name='conversation')
    results = vector_db.query(query_embeddings=[prompt_embedding], n_results=1)
    best_embedding = results['documents'][0][0]

    for best in best_embedding:
        if best not in embeddings:
            if 'yes' in classify_embedding(query=query, content=best):
                embeddings.add(best)


    return best_embedding


def create_queries(Prompt):
    query_msg = ("abc")
    query_convo = [{'role':'system', 'content': query_msg}]
    response = ollama.chat(model='llama3', messages=query_convo)
    print(f'\nVector database queries : {response["message"]["content"]}\n')

    try:
        return ast.literal_eval(response['message']['content'])
    except:
        return [prompt]

    
def classify_embedding(query, context):
    classify_msg = ("/")

    classify_convo = [
        {'role':'system', 'content':classify_msg}
    ]

    role = ollama.chat(model='llama3', messages=classify_convo)
    return response['message']['content'].strip().lower()



def recall(prompt):
    queries = create_queries(prompt=prompt)
    embeddings = retrieve_embedding(queries=queries)
    convo.append({'role':'user', 'content': f'MEMORIES {embeddings} \n\n USER PROMPT : {prompt}'})
    print(f'\n{len(embeddings)} messages:response embeddings added for context')

conversation = fetch_conversation()
create_vector_db(conversation=message_history)


while true:
    prompt = input("user")

    if prompt[:7].lower() == '/recall':
        prompt = prompt[8:]
        recall(prompt=prompt)
        stream_response(prompt=prompt)

    else:
        convo.append({'role':'user', 'content':prompt})
        stream_response(prompt=prompt)
    
    stream_response(prompt=prompt) 
