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

       
        public List<string> Messages { get; set; }
        public int tabConversationsCount = 0;


        public Conversation()
        {
            this.Messages = new List<string>(); 

        }


        public void AddTabMessage(string message)
        {
            Messages.Add(message);
            tabConversationsCount++;
        }

      
        public List<string> GetTabMessage()
        {
            return Messages;
        }


        public override string ToString()
        {
            return string.Join(", ", Messages); // Joins the messages with a comma
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