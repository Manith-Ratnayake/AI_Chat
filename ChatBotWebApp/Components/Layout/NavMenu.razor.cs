using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using System.Text.Json;



namespace ChatBotWebApp.Components.Layout
{
    partial class NavMenu
    {
        private bool isSideBar = false;
        private Dictionary<string, string> firstValues = new();
        List<string> chatHeader = new();

        public async void ToggleSideBar()
        {
            isSideBar = !isSideBar;

            if (isSideBar)
            {
            }
        }


        public void NewChat()
        {

        }


        //public async Task ChatHeaders()
        //{
        //    {
        //        chatHeader.Clear();

        //        List<string> localStorageKeys = await JS.InvokeAsync<List<string>>("eval", @"
        //        return Object.keys(localStorage);
        //    ");

        //        foreach (var key in localStorageKeys)
        //        {
        //            chatHeader.Add(key);
        //        }

        //        Console.WriteLine(string.Join(", ", chatHeader)); // Log to check the keys
        //    }

        //}




        //private List<string> localStorageKeys = new();

        //protected override async Task OnInitializedAsync()
        //{
        //    localStorageKeys = await GetLocalStorageKeys();
        //}

        //public async Task<List<string>> GetLocalStorageKeys()
        //{
        //    // Call the JavaScript function to get keys
        //    return await JS.InvokeAsync<List<string>>("getLocalStorageKeys");
        //}
    








        }
}

