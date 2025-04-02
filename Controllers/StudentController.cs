using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolMgtSystem_authenticationDemo.Controllers
{
    [Authorize(Users = "DESKTOP-ABKHEEV\\XYZ")]
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult AboutStudents()
        {
            return View();
        }
        [Authorize]
        public ActionResult CheckResult()
        {
            return View();
        }
        [Authorize]
        public ActionResult SubmitExamForm()
        {
            return View();
        }
    }
}