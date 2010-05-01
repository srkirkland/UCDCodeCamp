using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace UcdMvcBootCamp.Core.Domain
{
    public class Speaker : DomainObject
    {
        private readonly ISet<Session> _sessions = new HashSet<Session>();

        public Speaker(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }

        protected Speaker() { }

        public virtual string FirstName { get; private set; }

        public virtual string LastName { get; private set; }

        public virtual string Bio { get; set; }

        public virtual IEnumerable<Session> GetSessions()
        {
            return _sessions;
        }

        public virtual void Register(Session session)
        {
            _sessions.Add(session);
        }
    }
}
