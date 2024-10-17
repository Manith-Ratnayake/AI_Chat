using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlintecChatBotApp.Components.Models
{

    public class ChatApp
    {
        public List<Conversation> tabList { get; set; } = new List<Conversation>();
        private int currentTabId = 1; 


        public void AddConversationTab()
        {
            Conversation newTab = new Conversation(currentTabId);
            tabList.Add(newTab);
            currentTabId++;
        }



        public List<int> GetAllTabIds()
        {
            return tabList.Select(tab => tab.tabId).ToList();
        }



        public Conversation GetTabConversation(int tabId)
        {
            var conversation = tabList.FirstOrDefault(tab => tab.tabId == tabId);
            if (conversation == null)
            {
                throw new KeyNotFoundException("Invalid tab ID.");
            }
            return conversation;
        }


    }
}