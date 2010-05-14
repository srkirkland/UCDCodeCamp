using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Controller;
using UcdMvcBootCamp.Core.Domain;
using System.ComponentModel;

namespace UcdMvcBootCamp.Controllers
{
    public class ConferenceController : ApplicationController
    {
        private readonly IRepository<Conference> _conferenceRepository;

        //
        // GET: /Conference/
        public ConferenceController(IRepository<Conference> conferenceRepository)
        {
            _conferenceRepository = conferenceRepository;
        }

        public ActionResult Index(int minSessions = 0)
        {
            var allConferences = from c in _conferenceRepository.Queryable
                                 where c.SessionCount >= minSessions
                                 select
                                     new ConferenceListModel
                                         {Id = c.Id, Name = c.Name, SessionCount = c.SessionCount, AttendeeCount = c.AttendeeCount};


            return View(allConferences.ToList());
        }

        public ActionResult Edit(string name)
        {
            var conference = _conferenceRepository.Queryable.Single(x=>x.Name == name);
            
            return View(conference);
        }

        [HttpPost]
        public ActionResult Edit(Conference conference)
        {
            var conferenceToEdit = _conferenceRepository.GetNullableById(conference.Id);

            conferenceToEdit.ChangeName(conference.Name);
            
            _conferenceRepository.EnsurePersistent(conferenceToEdit);

            return RedirectToAction("Index");
        }

        public ActionResult Show(string name)
        {
            var conference = _conferenceRepository.Queryable.Single(x => x.Name == name);

            var conf = new ConferenceShowModel
                           {
                               Name = conference.Name,
                               Sessions =
                                   conference.Sessions.Select(
                                       x =>
                                       new ConferenceShowModel.SessionShowModel()
                                           {
                                               Title = x.Title,
                                               SpeakerFirstName = x.Speaker.FirstName,
                                               SpeakerLastName = x.Speaker.LastName
                                           }).ToList()
                           };

            return View(conf);
        }

        public ActionResult Register(string name)
        {
            var conference = _conferenceRepository.Queryable.Single(x => x.Name == name);

            var model = new RegistrationEditModel(conference);
            
            return View(model);
        }

        [HttpPost]
        public ActionResult Register(RegistrationEditModel registrationEditModel)
        {
            if (ModelState.IsValid)
            {
                var attendee = new Attendee(registrationEditModel.FirstName, registrationEditModel.LastName)
                                   {Email = registrationEditModel.Email};

                attendee.RegisterFor(_conferenceRepository.GetById(registrationEditModel.ConferenceId));
                
                //save
                return RedirectToAction("Index");
            }

            return View();
        }
    }

    public class RegistrationEditModel
    {
        public RegistrationEditModel(Conference conference)
        {
            ConferenceId = conference.Id;
            ConferenceName = conference.Name;
        }

        public RegistrationEditModel()
        {
            
        }

        [HiddenInput(DisplayValue = false)]
        public int ConferenceId { get; set; }

        [HiddenInput(DisplayValue = true)]
        public string ConferenceName { get; set; }

        [Required]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [Required]
        [DisplayName("Last Name")]
        public string LastName { get; set; }
        public string Email { get; set; }
    }

    public class ConferenceShowModel
    {
        public ConferenceShowModel()
        {
            Sessions = new List<SessionShowModel>();
        }

        public string Name { get; set; }

        public List<SessionShowModel> Sessions { get; set; }

        public class SessionShowModel
        {
            public string Title { get; set; }
            public string SpeakerFirstName { get; set; }
            public string SpeakerLastName { get; set; }
        }
    }

    public class ConferenceListModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int SessionCount { get; set; }
        public int AttendeeCount { get; set; }
    }
}
