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
    
    public partial class WorkProvince
    {
        public int workprovince_id { get; set; }
        public Nullable<int> province_id { get; set; }
        public Nullable<int> work_id { get; set; }
        public Nullable<int> employer_id { get; set; }
    
        public virtual Employer Employer { get; set; }
        public virtual Province Province { get; set; }
        public virtual Work Work { get; set; }
    }
}
