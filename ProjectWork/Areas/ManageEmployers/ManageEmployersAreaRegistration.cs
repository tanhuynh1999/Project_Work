using System.Web.Mvc;

namespace ProjectWork.Areas.ManageEmployers
{
    public class ManageEmployersAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "ManageEmployers";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "ManageEmployers_default",
                "ManageEmployers/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}