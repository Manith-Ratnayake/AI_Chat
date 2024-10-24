using Microsoft.JSInterop;
using FlintecChatBotApp.Components.Models;


namespace FlintecChatBotApp.Components.Pages
{
    partial class Home
    {

        public string? randomAnswer;  
        Conversation userConversation = new();
        public List<string>? messages = [];

        public bool isChnagedAfterCreation = false;

        public string userQuestion = "";
        public string? userAnswer;

        public void UserSubmitQuestion()
        {
           
            if (!string.IsNullOrEmpty(userQuestion))
            {

                GenerateAnswer();

                JSRuntime.InvokeVoidAsync("console.log", $"Count : {messages.Count()}");


                messages.Add(userQuestion);
                messages.Add(userAnswer);

                if (messages.Count == 2)
                {

                    
                    JSRuntime.InvokeVoidAsync("console.log", $"Added This Message to The LIST");
                    userConversation.CreateNewConversation();


                }

                if (isChnagedAfterCreation == false)
                {

                    UpdateConversation();
                }



                userQuestion = string.Empty;
                userAnswer    = string.Empty;

            }
        }


        public void CreateNewConversation()
        {
            messages = [];


        }


        public void UpdateConversation()
        {
            userConversation.UpdateConversation(userQuestion, userAnswer);
        }


        public void GetConversation(int tabNumber)
        {
            isChnagedAfterCreation = true;
            JSRuntime.InvokeVoidAsync("console.log", $"{tabNumber}");
            messages = userConversation.GetConversation(tabNumber);
            JSRuntime.InvokeVoidAsync("console.log", $"Getting Tab : {messages}");

        }











    }
}


//userConversation.CreateNewConversation(new Conversation());
//userConversation.messages.Clear();

