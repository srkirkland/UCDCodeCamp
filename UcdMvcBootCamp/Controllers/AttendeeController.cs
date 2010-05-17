using System.Linq;
using System.Web.Mvc;
using UcdMvcBootCamp.Core.Domain;

namespace UcdMvcBootCamp.Controllers
{
    public class AttendeeController : ApplicationController
    {
        public ActionResult List(string conferenceName)
        {
            var conference = Repository.OfType<Conference>().Queryable.Single(x => x.Name == conferenceName);

            var model =
                conference.GetAttendees().Select(
                    x => new AttendeeListModel {FirstName = x.FirstName, LastName = x.LastName});

            return PartialView(model);   
        }
    }

    public class AttendeeListModel
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
