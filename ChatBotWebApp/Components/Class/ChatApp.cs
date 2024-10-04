namespace ChatBotWebApp.Components.Class
{
    public class ChatApp
    {
        private Dictionary<int, ChatTab> chatTabs = new Dictionary<int, ChatTab>();

        public void AddNewTab()
        {
            int newTabId = chatTabs.Count + 1;
            chatTabs[newTabId] = new ChatTab { TabId = newTabId };
        }

        public ChatTab GetTab(int tabId)
        {
            return chatTabs.ContainsKey(tabId) ? chatTabs[tabId] : null;
        }
    }

}
