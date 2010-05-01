using System.Collections.Generic;
using System.Linq;
using UCDArch.Core.DomainModel;

namespace UcdMvcBootCamp.Core.Domain
{
    public class Conference : DomainObject
    {
        private readonly ISet<Attendee> _attendees = new HashSet<Attendee>();
        private readonly ISet<Session> _sessions = new HashSet<Session>();

        public Conference(string name)
        {
            Name = name;
            AttendeeCount = 0;
            SessionCount = 0;
        }

        protected Conference() { }

        public virtual string Name { get; private set; }
        public virtual int AttendeeCount { get; private set; }
        public virtual int SessionCount { get; private set; }

        public virtual void ChangeName(string name)
        {
            Name = name;
        }

        public virtual IEnumerable<Attendee> GetAttendees()
        {
            return _attendees;
        }

        public virtual Attendee GetAttendee(int attendeeId)
        {
            return _attendees.First(a => a.Id == attendeeId);
        }

        public virtual void AddSession(Session session)
        {
            _sessions.Add(session);
            session.Conference = this;
            SessionCount++;
        }

        public virtual IEnumerable<Session> GetSessions()
        {
            return _sessions;
        }

        protected internal virtual void AddAttendee(Attendee attendee)
        {
            _attendees.Add(attendee);
            AttendeeCount++;
        }
    }
}
