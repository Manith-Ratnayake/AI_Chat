using ChatBotWebApp.Components.Pages;


namespace ChatBotWebApp.Components
{

    public class UserQuestions
    {

        private Home homeInstance ;


        public List<string> userQuestions { get; set; } = [];
        public event Action OnQuestionsChanged;


        public void AddQuestion(List<string> question)
        {
                userQuestions = question;
          


        }

        public void ClearQuestions()
        {
            userQuestions.Clear();
              
        }


    }
}

