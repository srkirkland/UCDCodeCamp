﻿using System.Collections.Generic;
using UCDArch.Core.DomainModel;

namespace UcdMvcBootCamp.Core.Domain
{
    public class Speaker : DomainObject
    {
        public virtual IList<Session> Sessions { get; set; }

        public Speaker(string firstName, string lastName) : this()
        {
            FirstName = firstName;
            LastName = lastName;
        }

        public Speaker()
        {
            Sessions = new List<Session>();
        }

        public virtual string FirstName { get; private set; }

        public virtual string LastName { get; private set; }

        public virtual string Bio { get; set; }

        public virtual IEnumerable<Session> GetSessions()
        {
            return Sessions;
        }

        public virtual void Register(Session session)
        {
            Sessions.Add(session);
        }
    }
}
