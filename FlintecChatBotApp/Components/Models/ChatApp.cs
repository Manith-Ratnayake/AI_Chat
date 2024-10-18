using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlintecChatBotApp.Components.Models
{

    public class ChatApp
    {

        public Dictionary<int, Conversation> appConversation { get; set; } 
        public int currentTabId = 1; 



        public ChatApp() 
        {
            this.appConversation = new Dictionary<int, Conversation>();
           
        }




        public void CreateConversation(Conversation conversation)
        {
             
           appConversation.Add(currentTabId, conversation);
           currentTabId++;
        }




        public Conversation GetConversation(int requestedConversationId)
        {
              return appConversation[requestedConversationId];   
        }




        public ChatApp GetAllConversation()
        {
            return this;
        }



        public void UpdateConversation(int conversationId, string newMessage)
        {
            if (appConversation.TryGetValue(conversationId, out var conversation))
            {
                conversation.AddTabMessage(newMessage); 
            }
            else
            {
                Console.WriteLine("Conversation ID not found.");
            }
        }



        public void DeleteConversation(int conversationId)
        {
            if (appConversation.ContainsKey(conversationId))
            {
                appConversation.Remove(conversationId);
                Console.WriteLine($"Conversation with key {conversationId} has been removed.");
            }
            else
            {
                Console.WriteLine($"No conversation found with key {conversationId}.");
            }
        }


        public override string ToString()
        {
            return string.Join(", ", appConversation); // Joins the messages with a comma
        }



    }
}