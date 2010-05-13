using UCDArch.Core.DomainModel;

namespace UcdMvcBootCamp.Core.Domain
{
    public class Attendee : DomainObject
    {
        public Attendee(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }

        public Attendee() { }

        public virtual string FirstName { get; private set; }
        public virtual string LastName { get; private set; }
        public virtual string Email { get; set; }
        
        public virtual Conference Conference { get; private set; }

        public virtual void ChangeName(string firstName, string lastName)
        {
            FirstName = firstName;
            LastName = lastName;
        }

        public virtual void RegisterFor(Conference conference)
        {
            Conference = conference;
            conference.AddAttendee(this);
        }
    }
}