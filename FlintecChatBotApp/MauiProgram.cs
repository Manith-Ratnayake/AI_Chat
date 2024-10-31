using Microsoft.Extensions.Logging;
using FlintecChatBotApp.Components.Models;
using Microsoft.JSInterop;
using System.Globalization;



namespace FlintecChatBotApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

   

            builder.Services.AddMauiBlazorWebView();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
            builder.Services.AddSingleton<Conversation>();
            builder.Services.AddLocalization();
            builder.Services.AddLocalization(options => options.ResourcesPath = "Resources/Languages");

            builder.Services.AddLocalization();

            
#endif

            return builder.Build();
        }
    }
}
