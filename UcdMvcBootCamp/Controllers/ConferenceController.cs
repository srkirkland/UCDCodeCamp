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

        public ActionResult Index()
        {
            var allConferences = from c in _conferenceRepository.Queryable
                                 select
                                     new ConferenceListModel
                                         {Name = c.Name, SessionCount = c.SessionCount, AttendeeCount = c.AttendeeCount};


            return View(allConferences.ToList());
        }

    }

    public class ConferenceListModel
    {
        public string Name { get; set; }
        public int SessionCount { get; set; }
        public int AttendeeCount { get; set; }
    }
}
