using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using System.Security.Cryptography.X509Certificates;


namespace ChatBotWebApp.Components.Pages
{

    partial class Home
    {


        private int currentTabId = 1;
        public string? userQuestion { get; set; } 

        public bool login = false;
        string formattedDate;

        private string? userAnswer = @" Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lor Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printertook a galley of type and";

        Dictionary<int, List<string>> chatLog = new();

        List<string> userQuestions = new();




        public async Task ChatMessageSubmit()
        {

            if (userQuestions.Count == 0)
            {
                DateTime currentDateTime = DateTime.Now;
                formattedDate = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");

            }

            if (!string.IsNullOrEmpty(userQuestion))
            {

                userQuestions.Add(userQuestion);
                await SaveToLocalStorage();
                userQuestion = "";
                
            }
        }



        public void UserAnswerGenerator()
        {

        }
        

       


        public void EnterKey(KeyboardEventArgs e)
        {
            if (e.Key == "Enter")
            {
                ChatMessageSubmit();
            }
        }


        private async Task SaveToLocalStorage()
        {
            await JS.InvokeVoidAsync("localStorage.setItem", formattedDate, userQuestions);
        }







        

        public void SuggestionSelected(string suggestion)
        {
            userQuestion = suggestion;
        }






    }









 }

