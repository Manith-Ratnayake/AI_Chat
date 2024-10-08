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


        public List<string> userQuestions3 { get; set; } = new List<string>();


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
            userQuestions3.Clear();
            Console.WriteLine("Clear the list.........>>>>");
        }




        public void SettingsPopUp()
        {

          

        }



        public async Task oldChatSelect(string date)
        {
            var value = await localStorage.GetItemAsStringAsync(date);
            Console.WriteLine($"Retrieved value from localStorage: {value}");

            userQuestions3.Clear();


            if (!string.IsNullOrEmpty(value))
            {
                List <string> questions = value.Split(',').ToList();
                Console.WriteLine(">>> ");
                userQuestions3 = questions;
                foreach (var q in userQuestions3)
                {
                    Console.WriteLine(q);
                }


                if (homePage != null)  // Ensure homePage is not null
                {
                    Console.WriteLine("homePage NOT NULL.");

                    homePage.selectedOldAsync(userQuestions3);
                }
                else
                {
                    Console.WriteLine("homePage is null.");
                }

            }


        }


        private bool showSettings = false;

        private void ToggleSettings()
        {
            showSettings = !showSettings; // Toggle visibility
        }

        private void CloseSettings()
        {
            showSettings = false; // Close Settings when clicked elsewhere
        }


    }
 }




    


