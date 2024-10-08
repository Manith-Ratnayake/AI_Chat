using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace ChatBotWebApp.Components.Pages
{
    partial class Home
    {
        public List<string> userQuestions2 { get; set; } = new List<string>();
        private int currentTabId = 1;
        public string? userQuestion { get; set; }
        public bool login = false;
        string formattedDate;

        private string? userAnswer = @" Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lor Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and";

        Dictionary<int, List<string>> chatLog = new();

        protected override async Task OnInitializedAsync()
        {
            Console.WriteLine("OnInitializedAsync called.");
            // Ensure navMenu is initialized before using it
            if (navMenu != null && navMenu.userQuestions3 != null)
            {
                await selectedOldAsync(navMenu.userQuestions3);
            }
            else
            {
                Console.WriteLine("navMenu or userQuestions3 is not initialized.");
            }
        }

        public async Task ChatMessageSubmit()
        {
            Console.WriteLine("ChatMessageSubmit called.");
            if (navMenu.userQuestions3.Count == 0)
            {
                DateTime currentDateTime = DateTime.Now;
                formattedDate = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");
            }

            if (!string.IsNullOrEmpty(userQuestion))
            {
                navMenu.userQuestions3.Add(userQuestion);
                await SaveToLocalStorage();
            }

            await InvokeAsync(StateHasChanged);
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
            await JS.InvokeVoidAsync("localStorage.setItem", formattedDate, navMenu.userQuestions3);
        }

        public void SuggestionSelected(string suggestion)
        {
            navMenu.userQuestions3 = new List<string> { suggestion };
            InvokeAsync(StateHasChanged);
        }

        public async Task selectedOldAsync(List<string> list)
        {
            try
            {
                if (list != null && list.Any())
                {
                    Console.WriteLine("Received the gift");
                    userQuestions2 = list;
                    Console.WriteLine(userQuestions2.Count());
                    await InvokeAsync(StateHasChanged);
                    Console.WriteLine("What wrong with you");
                }
                else
                {
                    Console.WriteLine("No items in the list.");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in selectedOldAsync: {ex.Message}");
            }
        }

        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            if (firstRender)
            {
                Console.WriteLine("OnAfterRenderAsync called for the first render.");
                if (navMenu?.userQuestions3 != null && navMenu.userQuestions3.Any())
                {
                    await selectedOldAsync(navMenu.userQuestions3);
                }
                else
                {
                    Console.WriteLine("No questions available to display during first render.");
                }
            }
        }
    }
}
