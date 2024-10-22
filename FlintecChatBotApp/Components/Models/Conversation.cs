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

        public Dictionary<int, Conversation> conversations = new();
        public List<string> messages = new();
        
        public int pointingTab = 1;
        public int totalTabs = 1;

        public string userQuestion;
        public string userQuestionAnswer;

       
        public List<string> GetConversation(int tabNumber)
        {
            return conversations[tabNumber].messages;
        }


        public void DeleteConversation(int tabNumber)
        {
            conversations.Remove(tabNumber);
        }


        public void CreateNewConversation(List<Conversation> userConversation)
        {
            conversations.Add(totalTabs, userConversation);
            var messages = new List<string>();
            totalTabs++;
        }







    }
}














/*
public string TabName { get; set; }
public Message ChatInstance { get; private set; }

public Tab(string tabName)
{
    TabName = tabName;
    ChatInstance = new Message();
}

public void AddMessageToChat(string message)
{
    ChatInstance.AddMessage(message);
}

public List<string> GetChatMessages()
{
    return ChatInstance.GetMessages();
}

*/