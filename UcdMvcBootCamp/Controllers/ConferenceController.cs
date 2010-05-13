using System.Linq;
using System.Web.Mvc;
using UCDArch.Core.PersistanceSupport;
using UCDArch.Web.Controller;
using UcdMvcBootCamp.Core.Domain;

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

        public ActionResult Edit(int id)
        {
            var conference = _conferenceRepository.GetNullableById(id);
            
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

    }

    public class ConferenceListModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int SessionCount { get; set; }
        public int AttendeeCount { get; set; }
    }
}
