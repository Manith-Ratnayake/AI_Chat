
namespace ChatBotWebApp.Components
{

    public class UserQuestions
    {

        public List<string> userQuestions { get; set; } = new List<string>();
        public event Action OnQuestionsChanged;


        public void AddQuestion(List<string> question)
        {
                userQuestions = question;
                OnQuestionsChanged?.Invoke(); // Notify subscribers

        }

        public void ClearQuestions()
        {
            userQuestions.Clear();
            OnQuestionsChanged?.Invoke(); // Notify subscribers
        }


    }
}

