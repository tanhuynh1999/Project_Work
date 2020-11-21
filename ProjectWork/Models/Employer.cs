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
    
    public partial class Employer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employer()
        {
            this.Works = new HashSet<Work>();
        }
    
        public int employer_id { get; set; }
        public string employer_email { get; set; }
        public string employer_pass { get; set; }
        public string employer_fullname { get; set; }
        public string employer_company { get; set; }
        public Nullable<int> employer_position { get; set; }
        public string employer_address { get; set; }
        public string employer_phone { get; set; }
        public string employer_token { get; set; }
        public Nullable<System.DateTime> employer_datelogin { get; set; }
        public Nullable<System.DateTime> employer_datecreated { get; set; }
        public Nullable<bool> employer_active { get; set; }
        public Nullable<bool> employer_status { get; set; }
        public string employer_logo { get; set; }
        public string employer_specialized { get; set; }
        public Nullable<int> employer_version { get; set; }
        public Nullable<bool> employer_option { get; set; }
        public Nullable<bool> employer_personalpage { get; set; }
        public string employer_name { get; set; }
        public string employer_introduce { get; set; }
        public string employer_linkfc { get; set; }
        public string employer_recruitment { get; set; }
        public string employer_addressmain { get; set; }
        public string employer_ifamemapmain { get; set; }
        public string employer_addresstwo { get; set; }
        public string employer_ifamemaptwo { get; set; }
        public string employer_addressthree { get; set; }
        public string employer_ifamemapthree { get; set; }
        public string employer_province { get; set; }
        public string employer_recrequirement { get; set; }
        public Nullable<int> employer_limit { get; set; }
        public string employer_emailcompany { get; set; }
        public string employer_banner { get; set; }
        public Nullable<int> employer_scale { get; set; }
        public string employer_bonus { get; set; }
        public Nullable<int> employer_foundedyear { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Work> Works { get; set; }
    }
}
