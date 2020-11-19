using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjectWork.Models
{
    public class ViewReg
    {
        public string DisplayName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }

    public class ViewLogIn
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ReturnUrl { get; set; }
    }

    public class ViewResetPass
    {
        public string OldPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public string NewPassword { get; set; }
    }
}