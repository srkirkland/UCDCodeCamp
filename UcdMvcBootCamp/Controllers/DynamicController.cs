using System.Web.Mvc;

namespace UcdMvcBootCamp.Controllers
{
    public class DynamicController : Controller
    {
        //
        // GET: /Dynamic/

        public ActionResult Index(string text)
        {
            ViewData["text"] = text;

            return View();
        }

        public ActionResult GoTo(string gotoUrl)
        {
            return Redirect(gotoUrl);
        }
    }
}
