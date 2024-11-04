using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http.Headers;




namespace FlintecChatBotApp.Components.Pages
{

    public class CoPilotService
    {
        private readonly HttpClient _httpClient;

        public CoPilotService(HttpClient httpClient)
        {
            _httpClient = httpClient;
            _httpClient.BaseAddress = new Uri("https://api.copilotstudio.com/"); // Replace with actual API base URL
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "YourTokenHere");
        }

        public async Task<HttpResponseMessage> SendRequestAsync()
        {
            var response = await _httpClient.GetAsync("your-endpoint"); // Adjust endpoint accordingly
            return response;
        }
    }

}
