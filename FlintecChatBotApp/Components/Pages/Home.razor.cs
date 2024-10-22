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




        public void UserSubmitQuestion()
        {
           
            if (!string.IsNullOrEmpty(userConversation.userQuestion))
            {

                GenerateAnswer();

                userConversation.messages.Add(userConversation.userQuestion);
                userConversation.messages.Add(userConversation.userQuestionAnswer);


                userConversation.userQuestion       = string.Empty;
                userConversation.userQuestionAnswer = string.Empty;

            }

        }


        public void CreateNewConversation()
        {
            userConversation.CreateNewConversation(userConversation.messages);
        }

        public void EnterKeyPressed(KeyboardEventArgs e)
        {
            if (e.Key == "Enter")
            {

                 JSRuntime.InvokeVoidAsync("console.log", $"Enter Pressed userQuestion: {userConversation.userQuestion}");
                 UserSubmitQuestion();
            }
        }



        public List<string> PossibleReplies = new List<string>
    {
        "Sure, I can help with that.",
        "Let me check on that for you.",
        "I'll get back to you shortly.",
        "Can you provide more details?",
        "That sounds interesting!",
        "Let me assist you with that.",
        "I'm not sure, let me find out."
    };



    public void GenerateAnswer()
    {
        var random = new Random();
        int index = random.Next(PossibleReplies.Count);
        JSRuntime.InvokeVoidAsync("console.log", PossibleReplies[index] + "--------RETURN");
            userConversation.userQuestionAnswer =  PossibleReplies[index];
    }











    }
}
