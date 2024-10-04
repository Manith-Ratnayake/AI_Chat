namespace ChatBotWebApp.Components.Class
{
    public class ChatTab
    {
        public int TabId { get; set; }
        public List<Message> Messages { get; set; } = new List<Message>();

        public void SendMessage(string user, string text)
        {
            Messages.Add(new Message { User = user, Text = text });
            // Simulate response
            Messages.Add(new Message { User = "ChatGPT", Text = $"Response to: {text}" });
        }
    }

}
