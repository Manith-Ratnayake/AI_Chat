//using Microsoft.JSInterop;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using Microsoft.JSInterop;


//namespace FlintecChatBotApp.Components.Models
//{

//    public class Account
//    {

//        public Dictionary<int, Conversation> UserAccountConversation { get; set; } 
       
//        public int noOfTabsUsed  = 1;
//        public int pointingTab  = 1;





//        private readonly IJSRuntime JSRuntime;


//        public Account() 
//        {
//            this.UserAccountConversation = new Dictionary<int, Conversation>();
//        }




//        public void CreateConversation(Conversation conversation)
//        {
             
//           UserAccountConversation.Add(noOfTabsUsed, conversation);
//           noOfTabsUsed++;
//           pointingTab = noOfTabsUsed;

//        }




//        public Conversation GetConversation(int requestedConversationId)
//        {
//            this.pointingTab = requestedConversationId;
//            return UserAccountConversation[requestedConversationId];   
//        }




//        public Account GetAllConversation()
//        {
//            return this;
//        }



//        public void UpdateConversation(string newMessage)
//        {

//        }



//        public void DeleteConversation(int conversationId)
//        {
//            if (UserAccountConversation.ContainsKey(conversationId))
//            {
//                UserAccountConversation.Remove(conversationId);
//                Console.WriteLine($"Conversation with key {conversationId} has been removed.");
//            }
//            else
//            {
//                Console.WriteLine($"No UserAccountConversation found with key {conversationId}.");
//            }
//        }


//        public override string ToString()
//        {
//            return string.Join(", ", UserAccountConversation); // Joins the messages with a comma
//            //return "hello";
//        }





/*

JSRuntime.InvokeVoidAsync("console.log", "Hello Why not me ");


//if (UserAccountConversation.TryGetValue(pointingTab, out var UserAccountConversation))
//{
//    UserAccountConversation.AddTabMessage(newMessage);
//    throw new NotImplementedException();

//}
//else
//{
//    Console.WriteLine("Conversation ID not found.");
//    throw new NotImplementedException();

//}



JSRuntime.InvokeVoidAsync("console.log", newMessage + " whola::::::::::");


if (UserAccountConversation.TryGetValue(pointingTab, out Conversation? value))
{
    var conversation = value;
    conversation.AddTabMessage(newMessage);  // Add the message to the UserAccountConversation
}
else
{
    Console.WriteLine("Conversation ID not found.");
    //var UserAccountConversation = UserAccountConversation[pointingTab];
    //UserAccountConversation.AddTabMessage(newMessage);
}

*/
