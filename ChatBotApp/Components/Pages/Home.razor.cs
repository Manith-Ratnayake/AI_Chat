using Microsoft.JSInterop;
using FlintecChatBotApp.Components.Models;
using System.Globalization;


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

                AnimateText();

                userQuestion = string.Empty;
                userAnswer    = string.Empty;

                
            }
        }


        public void CreateNewConversation()
        {
            isChnagedAfterCreation = false;
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




        private async Task AnimateText()
        {
            try
            {
                // Show all elements with the class "AnimationText"
                await JSRuntime.InvokeVoidAsync("showTextElements", "AnimationText");

                // Then start the text animation on all elements with the class "AnimationText"
                await JSRuntime.InvokeVoidAsync("AnimateTextTyping", "AnimationText");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}"); // Log the error message to the console
                await JSRuntime.InvokeVoidAsync("alert", "An error occurred: " + ex.Message);
            }
        }





    }
}


//userConversation.CreateNewConversation(new Conversation());
//userConversation.messages.Clear();

