using Microsoft.JSInterop;
using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlintecChatBotApp.Components.Models
{
    public class Conversation
    {

        public List<Conversation> conversations = new();
        public List<string>? messages = new();
        
     

       
        public List<string> GetConversation(int tabNumber)
        {
            return conversations[tabNumber].messages;
        }


        public void DeleteConversation(int tabNumber)
        {
            conversations.RemoveAt(tabNumber);
        }

        public void CreateNewConversation(Conversation userMessages)
        {
            conversations.Add(userMessages);
        }


      



        public override string ToString()
        {
            if (messages == null || messages.Count == 0)
            {
                return "No messages available";
            }

            string combinedMessages = string.Join("", messages);
            return combinedMessages.Length > 1000 ? combinedMessages.Substring(0, 1000) : combinedMessages;
        }

        //public List<string> GetMessages()
        //{
        //    return messages;
        //}


        //public Dictionary<int, Conversation> GetConversations()
        //{
        //    return conversations;
        //}



    }
}
