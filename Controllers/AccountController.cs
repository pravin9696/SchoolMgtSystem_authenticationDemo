using SchoolMgtSystem_authenticationDemo.Models;
using SchoolMgtSystem_authenticationDemo.Models.validation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace SchoolMgtSystem_authenticationDemo.Controllers
{
   
    public class AccountController : Controller
    {
        StudDBEntities dbo = new StudDBEntities();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("login");
        }
       
        public ActionResult Login()
        {
            tblLoginModel lmg = new tblLoginModel() { RememberMe = true };
            return View(lmg);
        }
       
        [HttpPost]
        public ActionResult Login(tblLoginModel lgm)
        {
            if (ModelState.IsValid)
            {
                
                var loginDetails = dbo.tblLogins.FirstOrDefault(x => x.userid == lgm.userid && x.password == lgm.password);
                if (loginDetails!=null)
                {
                    FormsAuthentication.SetAuthCookie(loginDetails.userid, lgm.RememberMe);
                    return RedirectToAction("index","home");
                }
                ViewBag.msg = "Invalid User Name or password!!";
            }
           
              
                return View();
           
        }
    }
}