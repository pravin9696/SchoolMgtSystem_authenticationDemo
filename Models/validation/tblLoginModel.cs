using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SchoolMgtSystem_authenticationDemo.Models.validation
{
	public class tblLoginModel
	{
        public int Id { get; set; }
        [Required]
        public string userid { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string password { get; set; }
        public bool RememberMe { set; get; } = true;
    }
}