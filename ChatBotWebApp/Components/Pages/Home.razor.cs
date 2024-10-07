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

         //public List<string> userQuestions { get; set; } = new List<string>();




        public async Task ChatMessageSubmit()
        {

            if (userquestionComponent.userQuestions.Count == 0)
            {
                DateTime currentDateTime = DateTime.Now;
                formattedDate = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");

            }

            if (!string.IsNullOrEmpty(userQuestion))
            {

                userquestionComponent.userQuestions.Add(userQuestion);
                await SaveToLocalStorage();
                userQuestion = "";
                
            }

            StateHasChanged();
        }

        public void UserAnswerGenerator()
        {

        }
        
        public async Task EnterKey(KeyboardEventArgs e)
        {
            if (e.Key == "Enter")
            {
                await ChatMessageSubmit();
            }
        }


        private async Task SaveToLocalStorage()
        {
            await JS.InvokeVoidAsync("localStorage.setItem", formattedDate, userquestionComponent.userQuestions);
        }


        public void SuggestionSelected(string suggestion)
        {
            userquestionComponent.userQuestions = new List<string> { suggestion };
            StateHasChanged();
        }


        protected override void OnInitialized()
        {
            StateHasChanged();
            Console.WriteLine(userquestionComponent.userQuestions.Count());

        }

        public void Dispose()
        {
            StateHasChanged();
            Console.WriteLine(userquestionComponent.userQuestions.Count());
        }




    }

}

