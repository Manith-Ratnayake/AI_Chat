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
        public string? userQuestion;
        string timeChatStarted;
        string userQuestionAnswered;


        public ChatApp appInstance = new ChatApp();
        public Conversation conversation = new ();


        protected override void OnInitialized()
        {

        }


        public void UserSubmitQuestion()
        {
            JSRuntime.InvokeVoidAsync("console.log", "UserSubmitQuestion method triggered");
            JSRuntime.InvokeVoidAsync("console.log", "UserQuestion : " + userQuestion);



            if (userQuestion != string.Empty)
            {

                GenerateAnswer();
                MessagesSaveOnTab();
                userQuestion = string.Empty;
            }

        }

      

            public void MessagesSaveOnTab()
            {
                conversation.AddTabMessage(userQuestion);
                //conversation.AddTabMessage(userQuestionAnswered);
                Console.WriteLine(conversation.ToString());
                JSRuntime.InvokeVoidAsync("console.log", "Added List is  : " + conversation);

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
        userQuestionAnswered =  PossibleReplies[index];
    }











    }
}
