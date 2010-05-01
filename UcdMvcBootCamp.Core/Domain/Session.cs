using UCDArch.Core.DomainModel;

namespace UcdMvcBootCamp.Core.Domain
{
    public class Session : DomainObject
    {
        public Session(string title, string @abstract, Speaker speaker)
        {
            Title = title;
            Abstract = @abstract;
            Speaker = speaker;

            speaker.Register(this);
        }

        protected Session() { }

        public virtual string Title { get; private set; }
        public virtual string Abstract { get; private set; }
        public virtual Speaker Speaker { get; private set; }
        public virtual Conference Conference { get; protected internal set; }
    }
}
