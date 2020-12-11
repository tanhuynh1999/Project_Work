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
            this.Comments = new HashSet<Comment>();
            this.Orders = new HashSet<Order>();
            this.Works = new HashSet<Work>();
            this.WorkCategories = new HashSet<WorkCategory>();
            this.WorkProvinces = new HashSet<WorkProvince>();
        }
    
        public int employer_id { get; set; }
        public string employer_email { get; set; }
        public string employer_pass { get; set; }
        public string employer_company { get; set; }
        public string employer_introduct { get; set; }
        public Nullable<System.DateTime> employer_yeartoset { get; set; }
        public Nullable<int> employer_scale { get; set; }
        public string employer_yotube { get; set; }
        public string employer_product { get; set; }
        public string employer_develop { get; set; }
        public string employer_salary { get; set; }
        public string employer_promotion { get; set; }
        public Nullable<System.DateTime> employer_datecreate { get; set; }
        public Nullable<System.DateTime> employer_datelogin { get; set; }
        public Nullable<System.DateTime> employer_dateupdate { get; set; }
        public string employer_logo { get; set; }
        public string employer_address { get; set; }
        public string employer_fullname { get; set; }
        public Nullable<bool> employer_pageload { get; set; }
        public Nullable<bool> employer_active { get; set; }
        public Nullable<bool> employer_option { get; set; }
        public string employer_banner { get; set; }
        public string employer_fc { get; set; }
        public string employer_website { get; set; }
        public Nullable<int> employer_amoutwork { get; set; }
        public Nullable<int> version_id { get; set; }
        public Nullable<bool> employer_del { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual Version Version { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Work> Works { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkCategory> WorkCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkProvince> WorkProvinces { get; set; }
    }
}
