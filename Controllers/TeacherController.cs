using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolMgtSystem_authenticationDemo.Controllers
{
   
    public class TeacherController : Controller
    {
        // GET: Teacher
        [Authorize(Users = "DESKTOP-ABKHEEV\\ACER")]
        public ActionResult Index()
        {
            return View();
        }
    }
}