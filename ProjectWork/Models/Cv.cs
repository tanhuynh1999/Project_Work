//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectWork.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cv
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cv()
        {
            this.SubmitCVs = new HashSet<SubmitCV>();
        }
    
        public int cv_id { get; set; }
        public string cv_fullname { get; set; }
        public string cv_location { get; set; }
        public Nullable<System.DateTime> cv_birth { get; set; }
        public string cv_phone { get; set; }
        public string cv_email { get; set; }
        public string cv_addpress { get; set; }
        public string cv_website { get; set; }
        public string cv_target { get; set; }
        public string cv_interests { get; set; }
        public string cv_information { get; set; }
        public string cv_title { get; set; }
        public string cv_img { get; set; }
        public Nullable<int> theme_id { get; set; }
        public Nullable<int> sex_id { get; set; }
        public Nullable<int> user_id { get; set; }
        public string cv_font { get; set; }
        public Nullable<int> cv_size { get; set; }
        public Nullable<int> cv_line { get; set; }
        public string cv_education { get; set; }
        public string cv_graduation { get; set; }
        public string cv_jobexperience { get; set; }
        public string cv_datejobexperience { get; set; }
        public string cv_outdooractivities { get; set; }
        public string cv_dateoutdooractivities { get; set; }
        public string cv_certificate { get; set; }
        public string cv_datecertificate { get; set; }
        public string cv_prize { get; set; }
        public string cv_dateprize { get; set; }
        public string cv_skill { get; set; }
        public string cv_dateskill { get; set; }
        public Nullable<int> species_id { get; set; }
        public Nullable<int> specialized_id { get; set; }
        public string cv_scores { get; set; }
        public string cv_company { get; set; }
        public string cv_jobposition { get; set; }
        public string cv_contentwork { get; set; }
        public string cv_organizationname { get; set; }
        public string cv_organizationalposition { get; set; }
        public string cv_contentorganizational { get; set; }
        public string cv_certificatename { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubmitCV> SubmitCVs { get; set; }
        public virtual Theme Theme { get; set; }
        public virtual Sex Sex { get; set; }
        public virtual User User { get; set; }
        public virtual Specialized Specialized { get; set; }
        public virtual Species Species { get; set; }
    }
}
