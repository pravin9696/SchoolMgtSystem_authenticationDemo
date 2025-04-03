using SchoolMgtSystem_authenticationDemo.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolMgtSystem_authenticationDemo.Controllers
{
   
    public class RolesController : Controller
    {
        StudDBEntities dbo = new StudDBEntities();
        // GET: Roles
        // display All Roles stored into table tblRoles in table format
        public ActionResult Index()
        {
            var roleList = dbo.tblRoles.ToList();

            return View(roleList);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var rs = dbo.tblRoles.Find(id);//id PK
            if (rs!=null)
            {
                return View(rs);
            }
            return View();
        }
        [HttpPost]
        public ActionResult Edit(tblRole rl)
        {
            var roleTemp = dbo.tblRoles.FirstOrDefault(x => x.id == rl.id);
            if (roleTemp!=null)
            {
                roleTemp.id = rl.id ;
                roleTemp.Role = rl.Role;
                int n = dbo.SaveChanges();
                if (n>0)
                {
                    return RedirectToAction("index");
                }
            }
            return View();
        }
    }
}