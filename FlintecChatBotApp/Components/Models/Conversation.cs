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

        public int tabId;
        public string? timeChatStarted;
        public List<string> tabConversations { get; set; } = [];
        public int tabConversationsCount = 0; 


        public Conversation(int tabId)
        {
            this.tabId = tabId; 

        }


        public void AddMessage(string message)
        {
            tabConversations.Add(message);
            tabConversationsCount++;
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