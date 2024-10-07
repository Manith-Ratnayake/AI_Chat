using ChatBotWebApp.Components.Pages;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using System.Text.Json;
 


namespace ChatBotWebApp.Components.Layout
{
    partial class NavMenu
    {
        List<string> chatHeader = new();

        private bool isSideBar = false;
        private Dictionary<string, List<string>> chatStoredDataOnBrowser = new();


        public async Task ToggleSideBar()
        {
            isSideBar = !isSideBar;

            if (isSideBar)
            {
                chatStoredDataOnBrowser = await JS.InvokeAsync<Dictionary<string, List<string>>>("getAllLocalStorageItems");

                if (chatStoredDataOnBrowser == null)
                {
                    chatStoredDataOnBrowser = new Dictionary<string, List<string>>();
                }

                else
                {
                    var sortedData = chatStoredDataOnBrowser
                                    .OrderByDescending(entry => DateTime.Parse(entry.Key)) // Sort by date in descending order
                                    .ToDictionary(entry => entry.Key, entry => entry.Value); // Convert back to Dictionary

                    // Now only take entry.Value and store it back into chatStoredDataOnBrowser
                    chatStoredDataOnBrowser = sortedData.ToDictionary(entry => entry.Key, entry => entry.Value);
                }

            }
        }



        public void NewChat()
        {

        }




        public void SettingsPopUp()
        {



        }



        public async Task oldChatSelect(string date)
        {
            var value = await localStorage.GetItemAsStringAsync(date);
            Console.WriteLine($"Retrieved value from localStorage: {value}");

            userquestionComponent.ClearQuestions();
            StateHasChanged();


            if (!string.IsNullOrEmpty(value))
            {
                List <string> questions = value.Split(',').ToList();
                userquestionComponent.AddQuestion(questions);
                userquestionComponent.userQuestions = questions;
                Console.WriteLine($"User Questions: {string.Join(", ", userquestionComponent.userQuestions)}");
                Console.WriteLine($"{userquestionComponent.userQuestions.Count()}");

            }


        }




    }
 }




    


