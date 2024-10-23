using Microsoft.AspNetCore.Components.Web;
using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FlintecChatBotApp.Components.Models;


namespace FlintecChatBotApp.Components.Pages
{
    partial class Home
    {
        public string? randomAnswer;  
        Conversation userConversation = new();

        public string userQuestion;
        public string userQuestionAnswer;

        public void UserSubmitQuestion()
        {
           
            if (!string.IsNullOrEmpty(userQuestion))
            {

                GenerateAnswer();

                userConversation.messages.Add(userQuestion);
                userConversation.messages.Add(userQuestionAnswer);
                JSRuntime.InvokeVoidAsync("console.log", $"Count : {userConversation.messages.Count()}");


                if (userConversation.messages.Count == 2)
                {
                    JSRuntime.InvokeVoidAsync("console.log", $"Added This Message to The LIST");

                    userConversation.CreateNewConversation(userConversation);
                }


                userQuestion       = string.Empty;
                userQuestionAnswer = string.Empty;

            }
        }


        public void CreateNewConversation()
        {
            userConversation.CreateNewConversation(userConversation);

            userConversation.CreateNewConversation(new Conversation());
            userConversation.messages.Clear();


        }


        public void GetConversation(int tabNumber)
        {
            JSRuntime.InvokeVoidAsync("console.log", $"{tabNumber}");
            
        }





        public void EnterKeyPressed(KeyboardEventArgs e)
        {
            if (e.Key == "Enter")
            {

                 JSRuntime.InvokeVoidAsync("console.log", $"Enter Pressed userQuestion: {userQuestion}");
                 UserSubmitQuestion();
            }
        }



        public List<string> PossibleReplies = new List<string>
        {
            "*******"
        };



    public void GenerateAnswer()
    {
        var random = new Random();
        int index = random.Next(PossibleReplies.Count);
            userQuestionAnswer =  PossibleReplies[index];
    }











    }
}
