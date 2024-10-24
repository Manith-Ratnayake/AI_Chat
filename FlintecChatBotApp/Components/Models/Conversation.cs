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

        public List<List<string>> conversations = new();
        public int pointingTab = 1;

        public List<string> GetConversation(int tabNumber)
        {
            pointingTab = tabNumber;
            return conversations[tabNumber];
        }


        public void DeleteConversation(int tabNumber)
        {
            pointingTab = conversations.Count - 1;
            conversations.RemoveAt(tabNumber);
        }

        public void CreateNewConversation()
        {
            List<string> newConversation = new List<string>();
            conversations.Add(newConversation);
            pointingTab = conversations.Count() -1  ;
        }


        public void UpdateConversation(string userQuestion, string userQuestionAnswer)
        {
            conversations[pointingTab].Add(userQuestion);
            conversations[pointingTab].Add(userQuestionAnswer);

        }



        public override string ToString()
        {
            if (conversations == null || conversations.Count == 0 )
            {
                return "No conversations available.";
            }

            string result = "";

            // Loop througheach conversation
            for (int i = 0; i < conversations.Count; i++)
            {
                result += $"Conversation {i }:\n";

                //// Check if the conversation has messages
                //if (conversations[i] == null || conversations[i].Count == 0)
                //{
                //    result += "  No messages.\n";
                //}
                //else
                //{
                //    // Add each message in the conversation
                //    foreach (var message in conversations[i])
                //    {
                //        result += $"  - {message}\n";
                //    }
                //}

                result += "\n"; // Add extra line break between conversations
            }

            return result;

        }




    }
}



//public List<string> GetMessages()
//{
//    return messages;
//}


//public Dictionary<int, Conversation> GetConversations()
//{
//    return conversations;
//}

//string combinedMessages = string.Join("", conversations);
//return combinedMessages.Length > 1000 ? combinedMessages.Substring(0, 1000) : combinedMessages;


//public List<string> GetMessages()
//{
//    return messages;
//}


//public Dictionary<int, Conversation> GetConversations()
//{
//    return conversations;
//}