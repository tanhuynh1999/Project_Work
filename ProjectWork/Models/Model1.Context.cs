﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DataWork_projectEntities : DbContext
    {
        public DataWork_projectEntities()
            : base("name=DataWork_projectEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Layout> Layouts { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<WorkCategory> WorkCategories { get; set; }
        public virtual DbSet<Employer> Employers { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<ExpYear> ExpYears { get; set; }
        public virtual DbSet<Province> Provinces { get; set; }
        public virtual DbSet<Sex> Sexes { get; set; }
        public virtual DbSet<Work> Works { get; set; }
        public virtual DbSet<Form> Forms { get; set; }
        public virtual DbSet<Search> Searches { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Cv> Cvs { get; set; }
        public virtual DbSet<Favourite> Favourites { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Reply> Replies { get; set; }
    }
}
