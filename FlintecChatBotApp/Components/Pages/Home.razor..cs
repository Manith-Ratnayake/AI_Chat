using Microsoft.JSInterop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlintecChatBotApp.Components.Pages
{
    partial class Home
    {

        public bool hasId = false;
       



        public void CreateConversationTab()
        {

            if (conversation.Messages.Count != 0)
            {

                if (hasId == false)
                {
                    appInstance.CreateConversation(conversation);

                }


                conversation = new();

            }


            else
            {
                conversation = new();
            }

        }





        public async Task GetConversationTab(int conversationId)
        {
            await JSRuntime.InvokeVoidAsync("console.log", "requested id" + conversationId);
            CreateConversationTab();
            this.conversation = appInstance.GetConversation(conversationId);
            hasId = true;
        }


        public async Task DeleteConversationTab(int conversationId)
        {
            await JSRuntime.InvokeVoidAsync("console.log", "requested delete" + conversationId);
            appInstance.DeleteConversation(conversationId);
        }


    }
}
