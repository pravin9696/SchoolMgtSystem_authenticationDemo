using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolMgtSystem_authenticationDemo.Controllers
{
   
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
        public ActionResult CheckResult()
        {
            return View();
        }
        
        public ActionResult SubmitExamForm()
        {
            return View();
        }
    }
}