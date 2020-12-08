//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectWork.Models.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class Work
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Work()
        {
            this.Favourites = new HashSet<Favourite>();
            this.SubmitCVs = new HashSet<SubmitCV>();
            this.SubmitCVs1 = new HashSet<SubmitCV>();
            this.WorkCategories = new HashSet<WorkCategory>();
            this.WorkProvinces = new HashSet<WorkProvince>();
        }
    
        public int work_id { get; set; }
        public string work_name { get; set; }
        public string work_img { get; set; }
        public Nullable<System.DateTime> work_deadline { get; set; }
        public Nullable<System.DateTime> work_createdate { get; set; }
        public string work_description { get; set; }
        public string work_request { get; set; }
        public string work_benefit { get; set; }
        public string work_address { get; set; }
        public string work_money { get; set; }
        public Nullable<int> work_amount { get; set; }
        public Nullable<bool> work_active { get; set; }
        public Nullable<bool> work_option { get; set; }
        public Nullable<int> work_view { get; set; }
        public Nullable<bool> work_del { get; set; }
        public Nullable<bool> work_status { get; set; }
        public Nullable<System.DateTime> work_dateupdate { get; set; }
        public Nullable<int> employer_id { get; set; }
        public Nullable<int> position_id { get; set; }
        public Nullable<int> sex_id { get; set; }
        public Nullable<int> province_id { get; set; }
        public Nullable<int> expyear_id { get; set; }
        public Nullable<int> form_id { get; set; }
        public string work_phoe { get; set; }
        public string work_email { get; set; }
        public string work_nickname { get; set; }
    
        public virtual Employer Employer { get; set; }
        public virtual ExpYear ExpYear { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Favourite> Favourites { get; set; }
        public virtual Form Form { get; set; }
        public virtual Position Position { get; set; }
        public virtual Province Province { get; set; }
        public virtual Sex Sex { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubmitCV> SubmitCVs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SubmitCV> SubmitCVs1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkCategory> WorkCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkProvince> WorkProvinces { get; set; }
    }
}
